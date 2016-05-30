#!/bin/sh

for i in {1..6}; 
do echo """music_directory		\"/home/jitka/git/ci_sny_snis/music\"
db_file			\"/home/jitka/git/ci_sny_snis/logs/player$i/mpd.db\"
log_file		\"/home/jitka/git/ci_sny_snis/logs/player$i/mpd.log\"
pid_file		\"/home/jitka/git/ci_sny_snis/logs/player$i/mpd.pid\"

port				\"660$i\"

audio_output {
	type		\"shout\"
	encoding	\"ogg\"			# optional
	name		\"Player $i Stream\"
	host		\"localhost\"
	port		\"8000\"
	mount		\"/player$i\"
	password	\"hackme\"
	quality		\"10.0\" #higher quailty mean also shorter ping
	format		\"44100:16:1\"
}

filesystem_charset		\"UTF-8\" 
""" > mpd.player$i.conf
done
