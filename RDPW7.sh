echo "Ðang t?i file xu?ng - Downloading Windows image..."
wget -O w7x64.img https://bit.ly/akuhnetw7X64
echo "Downloading ngrok..."
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Paste Authtoken here: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 3388 &>/dev/null &
echo Downloading file from repository...
apt-get install qemu
echo "Wait"
echo "Starting Windows"
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Ctrl+C d? copy - Ctrl+C To Copy"
echo Username: akuh
echo Password: Akuh.Net
echo "Ch? 1-2 phút d? hoàn t?t - Wait 1-2 minute to finish bot"
echo "Vui lòng không t?t c?a s? này - Dont Close This Tab"
echo "Please support toigamo.blogspot.com thank you"
qemu-system-x86_64 -hda w7x64.img -m 8G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware
sleep 43200