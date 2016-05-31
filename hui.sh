function generate {
echo """music_directory		\"/home/jitka/git/ci_sny_snis/music\"
db_file			\"/home/jitka/git/ci_sny_snis/logs/player$1/mpd.db\"
log_file		\"/home/jitka/git/ci_sny_snis/logs/player$1/mpd.log\"
pid_file		\"/home/jitka/git/ci_sny_snis/logs/player$1/mpd.pid\"

port				\"660$1\"

audio_output {
	type		\"shout\"
	encoding	\"ogg\"			# optional
	name		\"Player $1 Stream\"
	host		\"localhost\"
	port		\"8000\"
	mount		\"/player$1\"
	password	\"hackme\"
	quality		\"10.0\" #higher quailty mean also shorter ping
	format		\"44100:16:1\"
}

filesystem_charset		\"UTF-8\" 
""" > mpd.player$1.conf
}

function run() {
    mpd mpd.player$1.conf
    mpc -p 660$1 ls | mpc -p 660$1 add
    mpc -p 660$1 play
}

function add() {
    mpc -p 660$1 ls | mpc -p 660$1 add
}

function workshop () {
    mpc -p 660$1 crop
    mpc -p 660$1 add Workshop.mp3
    mpc -p 660$1 play 2
}

function scene () {
for i in {1..6}; 
do
    mpc -p 660$i crop
    mpc -p 660$i add story/scene$1-player$i.mp3
    mpc -p 660$i add scene$1
    mpc -p 660$i add emotions/
    mpc -p 660$i play 2
done
}

function stop {
for i in {1..6}; 
do
    mpd mpd.player$i.conf --kill
done
}

function update() {
    mpc update -p 660$1
}

function all() {
for i in {1..6}; 
do
    $1 $i
done
}

function ncmpc {
#printf "--tab -e \"ncmpc -p 660%s\" " {1..6}
gnome-terminal --tab -e "ncmpc -p 6601" --tab -e "ncmpc -p 6602" --tab -e "ncmpc -p 6603" --tab -e "ncmpc -p 6604" --tab -e "ncmpc -p 6605" --tab -e "ncmpc -p 6606"
}

case $1 in
    prepare)
        echo "Generating mpd configs."
        all generate
        echo "Updating mpd databases."
        all update
        ;;
	run)
		echo "Running mpd and adding playlist."
        all run
		;;
    stop)
        echo "Stopping mpd."
        all stop
        ;;
    ncmpc)
        echo "Running gnome-terminal with ncmpc tabs."
        ncmpc
        ;;
    add)
        echo "Adding all music to playlist."
        all add
        ;;
    workshop)
        echo "Workshop."
        all workshop
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
        TODO
        "
		;;
esac


