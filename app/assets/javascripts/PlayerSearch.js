/*  
This Javascript function takes a form with a search field for a player's name, a starting date,
and an ending date.

It then performs two asynchronous actions:

1. Using Ajax, the function performs an asynchronous call to a ruby function called 'search' that queries
a database to find matches.  It displays the closest match in a hidden div below the search field.

2. Also using Ajax, the function performs an asynchronous call when the form is submitted to a
ruby function called 'scrape'.  The function assembles a URL and provides the query parameters.
The resulting array is then parsed and displayed at the bottom of the page.
*/

function PlayerSearch (input, output, startDate, endDate, message) {
	this.inputElement = document.getElementById(input);
	this.outputElement = document.getElementById(output);
	this.startDate = document.getElementById(startDate);
	this.endDate = document.getElementById(endDate);
	
	this.search = "";
	var obj = this;
	
	// callback function for dynamically updating player name search results
	// dynamically adds search results below search bar
	this.callback = function(resultsArray) {
		obj.outputElement.innerHTML = "";
		
		if (resultsArray.length == 0) {
			return;
		}
	
		for(var i=0; i<resultsArray.length; i++) {
			var result = resultsArray[i];
			var newElement = document.createElement("DIV");
			newElement.innerHTML = result;
			obj.outputElement.appendChild(newElement);
		}
	}
	
	// onkeyup function that calls Ajax to perform search function on player name
	this.inputElement.onkeyup = function(event) {
		obj.keyUp(event);
	}
	
	// callback function for dynamically updating statistics
	// function takes array of stats and uses DOM to post results
	this.parseCallback = function(parseArray, outputElem, messageElem) {
		this.messageElement = messageElem;
		this.playerName = outputElem.textContent;
		this.messageElement.innerHTML = this.playerName + " from " + this.startDate + " to " + this.endDate + ":";
		
		if(parseArray.length == 0) {
			return;
		}
		
		len = parseArray.length;
		vorp = parseArray[len-1];
		var parseElement = document.createElement("DIV");
		parseElement.innerHTML = 'VORP = ' + vorp;
		this.messageElement.appendChild(parseElement);
	}
	
	// onsubmit function that calls Ajax to perform parsing function for stats
	// returns false in order to allow parsing function to persist after Ajax has completed
	var form = document.getElementById("form");
	form.onsubmit = function(event) {
		obj.formSubmit(event);
		return false;
	}
}

// assembles search parameters for player name search and passes to Ajax
// callback function is required to allow responseText (matching player names in database) to be accessed after Ajax function has completed
PlayerSearch.prototype.keyUp = function (event) {
	var searchValue = this.inputElement.value;
	
	if(this.search == searchValue) {
		return;
	}
	
	this.search = searchValue;
	
	var request = new Ajax("/players/search", this.search, this.callback);
	request.sendRequest();
}

function Ajax(url, query, callback) {
	this.url = url;
	this.query = query;
	this.callback = callback;
}

// Ajax function that opens XHR request, queues callback function, and creates/sends a Get request for player name search function
Ajax.prototype.sendRequest = function() {
	var request = new XMLHttpRequest();
	var obj = this;
	
	request.onreadystatechange = function() {
		if(this.readyState != 4 && this.status != 200) {
			return;
		}

		if(obj.callback) {
			obj.callback(eval(this.responseText));
		}
	}
			
	var query = encodeURIComponent(this.playerName);
	var searchUrl = "/players/search?search=" + this.query;
	
	request.open("GET", searchUrl, true);
	request.send();
}

// Assembles url and player name.  Creates url query for server-side parsing function and passes to Ajax
// callback function is required to allow responseText (array of parsed stats) to be accessed after Ajax function has completed	
// function uses player name in output DIV, not text in search field.  User only has to search until one name appears in output DIV.	
PlayerSearch.prototype.formSubmit = function(event) {
		this.playerName = this.outputElement.textContent;
		this.startDateVal = this.startDate.value;
		this.endDateVal = this.endDate.value;

		var startDateRe = encodeURIComponent(this.startDateVal);
		var endDateRe = encodeURIComponent(this.endDateVal);
		var url = "http://www.baseballmusings.com/cgi-bin/PlayerInfo.py?StartDate=" + startDateRe + "&EndDate=" + endDateRe + "&GameType=all&PlayedFor=0&PlayedVs=0&Park=0&PlayerID=";
		
		var parser = new AjaxParse(url, this.playerName, this.parseCallback, this.outputElement, this.messageElement, this.startDateVal, this.endDateVal);
		parser.parse();
	}	

function AjaxParse(url, player, parseCallback, output, message, startDate, endDate) {
	this.url = url;
	this.player = player;
	this.parseCallback = parseCallback;
	this.outputElement = output;
	this.messageElement = message;
	this.startDate = startDate;
	this.endDate = endDate;
}

// Ajax function that opens XHR request, queues parse callback function, and creates/sends a Get request for parsing function
AjaxParse.prototype.parse = function() {
	var parseRequest = new XMLHttpRequest();
	var parseObj = this;
	
	parseRequest.onreadystatechange = function() {
		if(this.readyState != 4 && this.status != 200) {
			return;
		}
		
		if(parseObj.parseCallback) {
			parseObj.parseCallback(eval(this.responseText), output, message);
		}
	}
	var parseUrl = "/players/scrape?player=" + this.player + "&url=" + this.url;
	
	parseRequest.open("GET", parseUrl, true);
	parseRequest.send();
}