dir="/home/hector/Videos"

tmp=$(date +%Y%M%d%H%m%S)
tmp_video="$dir/$tmp.mkv"
palette="$dir/$tmp.png"
output="$dir/$tmp.gif"

ntfy_app=dunstify

is_recording=$(pgrep -x wf-recorder)

if [[ $is_recording ]]; then
    kill $is_recording
    $ntfy_app "Stopped recording" --icon=amarok
    exit 0
fi

$ntfy_app "Screen is recording" --icon=green-recorder

wf-recorder --codec h264_vaapi -r 30 --geometry "$(slurp)" -f $tmp_video

$ntfy_app "Processing video..." --icon=hourglass
# Generating palette
ffmpeg -i $tmp_video -vf "fps=20,scale=960:-1:flags=lanczos,palettegen" -y $palette

# Converting video to gif
ffmpeg -i $tmp_video -i $palette -filter_complex "fps=20,scale=960:-1:flags=lanczos[x];[x][1:v]paletteuse=dither=bayer:bayer_scale=5" -y $output

rm $tmp_video
rm $palette

$ntfy_app  --icon=yast-checkmedia "Video is ready!" "You can find it here: $output"

