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
    mpc -p 660$i ls | mpc -p 660$i add
    mpc -p 660$i play
done
}

function add {
for i in {1..6}; 
do
    mpc -p 660$i ls | mpc -p 660$i add
done
}

function workshop {
for i in {1..6}; 
do
    mpc -p 660$i crop
    mpc -p 660$i add Workshop.mp3
    mpc -p 660$i play 2
done
}

function scene () {
for i in {1..6}; 
do
    mpc -p 660$i crop
    mpc -p 660$i add scenes/scene$1-player$i.mp3
    mpc -p 660$i add emotions/
    mpc -p 660$i play 2
done
}


#-p 6601 crop
#jitka@kren:~/git/ci_sny_snis $ mpc -p 6601 ls Final | mpc -p 6601 add
#jitka@kren:~/git/ci_sny_snis $ mpc -p 6601 play 2 


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
    add)
        echo "Adding all music to playlist."
        add
        ;;
    workshop)
        echo "Workshop."
        workshop
        ;;
    scene)
        echo "Scene $2."
        scene $2
        ;;
	*)
		echo "usage:
        generate
        run
        stop
        ncmpc
        update
        all
        "
		;;
esac


