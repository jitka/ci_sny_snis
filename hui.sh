function generate {
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
}

function run {
mpd mpd.player1.conf
mpd mpd.player2.conf
mpd mpd.player3.conf
mpd mpd.player4.conf
mpd mpd.player5.conf
mpd mpd.player6.conf
}

function stop {
mpd mpd.player1.conf --kill
mpd mpd.player2.conf --kill
mpd mpd.player3.conf --kill
mpd mpd.player4.conf --kill
mpd mpd.player5.conf --kill
mpd mpd.player6.conf --kill
}

function ncmpc {
gnome-terminal --tab -e "ncmpc -p 6601" --tab -e "ncmpc -p 6602" --tab -e "ncmpc -p 6603" --tab -e "ncmpc -p 6604" --tab -e "ncmpc -p 6605" --tab -e "ncmpc -p 6606"
}

case $1 in
    generate)
        echo "generating mpd configs"
        generate
        ;;
	run)
		echo "running mpd"
        run
		;;
    stop)
        echo "stopping mpd"
        stop
        ;;
    ncmpc)
        echo "running gnome-terminal with ncmpc tabs"
        ncmpc
        ;;
	*)
		echo "usage:
        generate
        run
        stop
        ncmpc
        "
		;;
esac


