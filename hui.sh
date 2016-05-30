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
for i in {1..6}; 
do
    mpd mpd.player$i.conf
    mpc -p 660$i ls Final | mpc -p 660$i add
done
}

function stop {
for i in {1..6}; 
do
    mpd mpd.player$i.conf --kill
done
}

function update {
for i in {1..6}; 
do
    mpc update -p 660$i
done
}

function ncmpc {
#printf "--tab -e \"ncmpc -p 660%s\" " {1..6}
gnome-terminal --tab -e "ncmpc -p 6601" --tab -e "ncmpc -p 6602" --tab -e "ncmpc -p 6603" --tab -e "ncmpc -p 6604" --tab -e "ncmpc -p 6605" --tab -e "ncmpc -p 6606"
}

case $1 in
    generate)
        echo "Generating mpd configs."
        generate
        ;;
	run)
		echo "Running mpd and adding playlist."
        run
		;;
    stop)
        echo "Stopping mpd."
        stop
        ;;
    ncmpc)
        echo "Running gnome-terminal with ncmpc tabs."
        ncmpc
        ;;
    update)
        echo "Updating mpd databases."
        update
        ;;
	*)
		echo "usage:
        generate
        run
        stop
        ncmpc
        update
        "
		;;
esac


