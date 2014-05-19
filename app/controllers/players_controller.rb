# This ruby function performs 3 functions:
#
# 1. Search function performs a lookup on database and returns closest matches to a search string.
#
# 2. Scrape function takes a url for scraping, completes the assembly of this url, and uses 
# Nokogiri to parse the page.  It returns an array from the scraped page.
#
# 3. CalcVORP function takes the array of statistics from the scraped page and returns the
# VORP for the player.
#
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class PlayersController < ApplicationController
	def new
        reset_session
        @player = Player.new
    end
	
	# takes player name and url params
	# constructs url and uses Nokogiri to open connection with required parameters
	# returns array of form [Games, AB, Runs, Hits, 2B, 3B, HR, RBI, BB, HBP, CS, SH, SF, GDP, BA, OBA, Slug%, OPS]
	def scrape
	
		
		player = params[:player]
		url = params[:url]
		endDate = params[:EndDate]
		filler = '&GameType=all&PlayedFor=0&PlayedVs=0&Park=0&PlayerID='
			
		id = Player.find_by_name(player).number.to_s
		fullUrl = url + '&EndDate=' + endDate + filler + id
		
		page = Nokogiri::HTML(open(fullUrl))
		
		totalsArray = getTotals(page)
		
		render :text => totalsArray.to_json()
	end

	# parses tables on web page and assembles response array
	def getTotals(page)
		totalsRow = page.css("table.dbd")[0].css("tr.toprow").last
		games = totalsRow.css("td.letter")[0].text.to_i
		
		# From Totals Row
		ab = totalsRow.css("td.number")[1].text.to_i
		runs = totalsRow.css("td.number")[2].text.to_i
		hits = totalsRow.css("td.number")[3].text.to_i
		dbl = totalsRow.css("td.number")[4].text.to_i
		tpl = totalsRow.css("td.number")[5].text.to_i
		hr = totalsRow.css("td.number")[6].text.to_i
		rbi = totalsRow.css("td.number")[7].text.to_i
		bb = totalsRow.css("td.number")[8].text.to_i
		hbp = totalsRow.css("td.number")[10].text.to_i
		cs = totalsRow.css("td.number")[13].text.to_i
		sh = totalsRow.css("td.number")[14].text.to_i
		sf = totalsRow.css("td.number")[15].text.to_i
		gdp = totalsRow.css("td.number")[16].text.to_i
				
		# From Summary Row
		ba = page.css("table.dbd")[1].css("tr")[1].css("td")[0].text.to_f
		oba = page.css("table.dbd")[1].css("tr")[1].css("td")[1].text.to_f
		slug = page.css("table.dbd")[1].css("tr")[1].css("td")[2].text.to_f
		ops = oba.to_f + slug.to_f
		
		solution = [games,ab,runs,hits,dbl,tpl,hr,rbi,bb,hbp,cs,sh,sf,gdp,ba,oba,slug,ops]
		vorp = calcVORP(solution)
		solution << vorp
		return solution
	end
	
	#Searches database and compares to search string; returns similar results
	def search

    	@matches = []

		pattern = params[:search].downcase
    	find = Regexp.new(Regexp.quote(pattern))
		
    	Player.all.each do |p|			
			player_matches = false
        	if p.name.downcase =~ find
          		player_matches = true
          		@matches << [p.name]
          		break
        	end
        end
        
    	render :text => @matches.to_json()
  	end
  	
  	#calculating VORP - comparing runs produced for replacement player vs. selected player, then normalize for 150 game season
  	# formula adapted from http://www.sportingcharts.com/articles/mlb/ultimate-guide-to-value-over-replacement-player-vorp.aspx
  	def calcVORP(statsArray)
		#constants
		lgBA = 0.253
		lgOBP = 0.317
		lgSLG = 0.396
		lgRunsPerOut = 0.1633
		replaceR = 0.8
		
		replaceRadical = (25 * lgOBP * lgSLG) / (1 - lgBA)
		replaceRoot = (replaceRadical ** (1/3.0))
		replaceP = (0.1073-(0.11 * replaceR)) * replaceRoot
		
		ab = statsArray[1]
		hits = statsArray[3]
		cs = statsArray[10]
		sh = statsArray[11]
		sf = statsArray[12]
		gdp = statsArray[13]
		
		totalOuts = ab - hits + cs + sh + sf + gdp
		totalSeasons = (statsArray[0].to_f) / 150
		adjustedOuts = (totalOuts / totalSeasons)
		runsProduced = (lgRunsPerOut * adjustedOuts)
		
		replaceRunsProduced = (replaceR * runsProduced)
		
		walks = statsArray[8]
		hbp = statsArray[9]
		doubles = statsArray[4]
		triples = statsArray[5]
		homeRuns = statsArray[6]
		
		totalBases = hits + doubles + (2 * triples) + (3 * homeRuns) + walks + hbp
		runsCreated = ((hits + walks) * totalBases) / (ab + walks)
		adjustedRunsCreated = (runsCreated / totalSeasons)
		
		vorp = (adjustedRunsCreated - replaceRunsProduced)
		
		return vorp.round(2)		
	end
	
end