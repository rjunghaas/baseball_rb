class LoadData < ActiveRecord::Migration
  def up
  	down
  	yc = Player.new(:name => "Yoenis Cespedes", :number => "13110")
  	yc.save(:validate => false)
  	
  	ar = Player.new(:name => "Alex Rodriguez", :number => "1274")
  	ar.save(:validate => false)
  	
  	sc = Player.new(:name => "Shin-Soo Choo", :number => "3174")
  	sc.save(:validate => false)
  	
  	ap = Player.new(:name => "Albert Pujols", :number => "1177")
  	ap.save(:validate => false)
  	
  	rc = Player.new(:name => "Robinson Cano", :number => "3269")
  	rc.save(:validate => false)
  	
  	jv = Player.new(:name => "Joey Votto", :number => "4314")
  	jv.save(:validate => false)
  	
  	pf = Player.new(:name => "Prince Fielder", :number => "4613")
  	pf.save(:validate => false)
  	
  	dj = Player.new(:name => "Derek Jeter", :number => "826")
  	dj.save(:validate => false)
  	
  	jm = Player.new(:name => "Joe Mauer", :number => "1857")
  	jm.save(:validate => false)
  	
  	mt = Player.new(:name => "Mark Teixeira", :number => "1281")
  	mt.save(:validate => false)
  	
  	bp = Player.new(:name => "Buster Posey", :number => "9166")
  	bp.save(:validate => false)
  	
  	mk = Player.new(:name => "Matt Kemp", :number => "5631")
  	mk.save(:validate => false)
  	
  	tt = Player.new(:name => "Troy Tulowitzki", :number => "3531")
  	tt.save(:validate => false)
  	
  	ag = Player.new(:name => "Adrian Gonzales", :number => "1908")
  	ag.save(:validate => false)
  	
  	mc = Player.new(:name => "Miguel Cabrera", :number => "1744")
  	mc.save(:validate => false)
  	
  	je = Player.new(:name => "Jacoby Ellsbury", :number => "4727")
  	je.save(:validate => false)
  	
  	cc = Player.new(:name => "Carl Crawford", :number => "1201")
  	cc.save(:validate => false)
  	
  	dw = Player.new(:name => "David Wright", :number => "3787")
  	dw.save(:validate => false)
  	
  	as = Player.new(:name => "Alfonso Soriano", :number => "847")
  	as.save(:validate => false)
  	
  	vw = Player.new(:name => "Vernon Wells", :number => "1326")
  	vw.save(:validate => false)
  	
  	jw = Player.new(:name => "Jayson Werth", :number => "1327")
  	jw.save(:validate => false)
  	
  	rz = Player.new(:name => "Ryan Zimmerman", :number => "4220")
  	rz.save(:validate => false)
  	
  	jh = Player.new(:name => "Josh Hamilton", :number => "1875")
  	jh.save(:validate => false)
  	
  	rh = Player.new(:name => "Ryan Howard", :number => "2154")
  	rh.save(:validate => false)
  	
  	jg = Player.new(:name => "Jason Giambi", :number => "818")
  	jg.save(:validate => false)
  	
  	mh = Player.new(:name => "Matt Holliday", :number => "1873")
  	mh.save(:validate => false)
  	
  	ea = Player.new(:name => "Elvis Andrus", :number => "8709")
  	ea.save(:validate => false)
  	
  	cb = Player.new(:name => "Carlos Beltran", :number => "589")
  	cb.save(:validate => false)
  	
  	dor = Player.new(:name => "David Ortiz", :number => "745")
  	dor.save(:validate => false)
  	
  	dp = Player.new(:name => "Dustin Pedroia", :number => "8370")
  	dp.save(:validate => false)
  	
  	jr = Player.new(:name => "Jose Reyes", :number => "1736")
  	jr.save(:validate => false)
  	
  	rb = Player.new(:name => "Ryan Braun", :number => "3410")
  	rb.save(:validate => false)
  	
  	el = Player.new(:name => "Evan Longoria", :number => "9368")
  	el.save(:validate => false)
  	
  	cl = Player.new(:name => "Carlos Lee", :number => "243")
  	cl.save(:validate => false)
  	
  	ae = Player.new(:name => "Andre Ethier", :number => "6265")
  	ae.save(:validate => false)
  	
  	hr = Player.new(:name => "Hanley Ramirez", :number => "8001")
  	hr.save(:validate => false)
  	
  	mt = Player.new(:name => "Mike Trout", :number => "10155")
  	mt.save(:validate => false)
  	
  	am = Player.new(:name => "Andrew McCutchen", :number => "9847")
  	am.save(:validate => false)
  	
  	jd = Player.new(:name => "Josh Donaldson", :number => "5038")
  	jd.save(:validate => false)
  	
  	pg = Player.new(:name => "Paul Goldschmidt", :number => "9218")
  	pg.save(:validate => false)
  	
  	yp = Player.new(:name => "Yasiel Puig", :number => "14225")
  	yp.save(:validate => false)
  	
  	cd = Player.new(:name => "Chris Davis", :number => "9272")
  	cd.save(:validate => false)
  	
  	bu = Player.new(:name => "B.J. Upton", :number => "5015")
  	bu.save(:validate => false)
  	
  	ju = Player.new(:name => "Justin Upton", :number => "5222")
  	ju.save(:validate => false)
  	
  	is = Player.new(:name => "Ichiro Suzuki", :number => "1101")
  	is.save(:validate => false)
  	
  	ab = Player.new(:name => "Adrian Beltre", :number => "639")
  	ab.save(:validate => false)
  	
  	jmo = Player.new(:name => "Justin Morneau", :number => "1737")
  	jmo.save(:validate => false)
  	
  	jro = Player.new(:name => "Jimmy Rollins", :number => "971")
  	jro.save(:validate => false)
  	
  	cu = Player.new(:name => "Chase Utley", :number => "1679")
  	cu.save(:validate => false)
  	
  	hp = Player.new(:name => "Hunter Pence", :number => "8252")
  	hp.save(:validate => false)
  	
  	cg = Player.new(:name => "Carlos Gonzalez", :number => "7287")
  	cg.save(:validate => false)
  	
  	cgom = Player.new(:name => "Carlos Gomez", :number => "4881")
  	cgom.save(:validate => false)
  	
  	gs = Player.new(:name => "Giancarlo Stanton", :number => "4949")
  	gs.save(:validate => false)
  	
  	ee = Player.new(:name => "Edwin Encarnacion", :number => "2151")
  	ee.save(:validate => false)
  	
  	jb = Player.new(:name => "Jay Bruce", :number => "9892")
  	jb.save(:validate => false)
  	
  	nc = Player.new(:name => "Nelson Cruz", :number => "2434")
  	nc.save(:validate => false)
  	
  	jb = Player.new(:name => "Jose Bautista", :number => "1887")
  	jb.save(:validate => false)
  	
  	cgrand = Player.new(:name => "Curtis Granderson", :number => "4747")
  	cgrand.save(:validate => false)
  	
  	ym = Player.new(:name => "Yadier Molina", :number => "7007")
  	ym.save(:validate => false)
  	
  	ad = Player.new(:name => "Adam Dunn", :number => "319")
  	ad.save(:validate => false)
  	
  	mr = Player.new(:name => "Mark Reynolds", :number => "7619")
  	mr.save(:validate => false)
  	
  	ff = Player.new(:name => "Freddie Freeman", :number => "5361")
  	ff.save(:validate => false)
  	
  	jh = Player.new(:name => "Jason Heyward", :number => "4940")
  	jh.save(:validate => false)
  	
  	bm = Player.new(:name => "Brian McCann", :number => "4810")
  	bm.save(:validate => false)
  	
  	bh = Player.new(:name => "Bryce Harper", :number => "11579")
  	bh.save(:validate => false)
  	
  	bp = Player.new(:name => "Brandon Phillips", :number => "791")
  	bp.save(:validate => false)
  	
  	ch = Player.new(:name => "Chase Headley", :number => "4720")
  	ch.save(:validate => false)
  	
  	ps = Player.new(:name => "Pablo Sandoval", :number => "5409")
  	ps.save(:validate => false)
  	
  	cc = Player.new(:name => "Coco Crisp", :number => "1572")
  	cc.save(:validate => false)
  	
  	ik = Player.new(:name => "Ian Kinsler", :number => "6195")
  	ik.save(:validate => false)
  		
  end

  def down
  	Player.delete_all
  end
end
