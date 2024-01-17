
if (multipass version)
then
  echo "multipass already installed"
else
  echo "installing multipass"
  sudo snap install multipass
  sleep 2
fi

if (multipass info local-vm)
then
  echo "local-vm already exist"
else
  echo "launching local-vm"
  multipass launch --name local-vm -c 4 -m 4G
fi