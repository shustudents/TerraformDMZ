# validate packer template
packer validate ami.json
pakcer validate amislave.json

# build ami
packer build ami.json
packer build amislave.json
