#!/bin/sh

####################
### Variables    ###
####################
VM_DIR="$HOME/JQVM/.qemu-vm" 
CONFIG_DIR="$VM_DIR/config-vm"
DISK_DIR="$VM_DIR/disks"

#################
### Funciones ###
#################
CREATE_STRUCTURE(){ 
	mkdir -p "$CONFIG_DIR" "$DISK_DIR" 
}

while true; do
    clear

cat << "EOF"

    $$$$$\ $$\   $$\ $$\    $$\ $$\      $$\ 
    \__$$ |$$ | $$  |$$ |   $$ |$$$\    $$$ |
       $$ |$$ |$$  / $$ |   $$ |$$$$\  $$$$ |
       $$ |$$$$$  /  \$$\  $$  |$$\$$\$$ $$ |
 $$\   $$ |$$  $$<    \$$\$$  / $$ \$$$  $$ |
 $$ |  $$ |$$ |\$$\    \$$$  /  $$ |\$  /$$ |
 \$$$$$$  |$$ | \$$\    \$  /   $$ | \_/ $$ |
  \______/ \__|  \__|    \_/    \__|     \__|
*--------------------------------------------* 
    [1] Create.
    [2] Start.
    [3] Delete.
    [0] Exit.
*--------------------------------------------*
EOF
	printf "Enter your order: " 
		read optionMAIN_QEMU
	case "$optionMAIN_QEMU" in 

    	1)
	#Creacion de la estructura de directorios.
	if [ ! -d "$VM_DIR" ]; then 
		CREATE_STRUCTURE 
	fi
		
	printf "VM name: " 
		read nameVM
        printf "Disk name: " 
		read name
        printf "Disk size (GB): " 
		read size
		
		disk="$VM_DIR/disks/${name}.qcow2"
                	qemu-img create -f qcow2 "$disk" "${size}G"

        printf "RAM (MB): " 
		read ram
        printf "CPUs: " 
		read cpu
        printf "ISO location: " 
		read iso
	
# Generacion de archivo de config de las VMs.
cat > "$CONFIG_DIR/${nameVM}.cfg" << EOF
NAME=$nameVM   
RAM=$ram       
CPU=$cpu       
ISO=$iso       
DISK=$disk         
EOF
	qemu-system-x86_64 \
		-enable-kvm \
		-m "$ram" \
		-smp "$cpu" \
		-boot d \
		-cdrom "$iso" \
	     	-drive file="$disk",format=qcow2 \
		-nic user,model=e1000 &


   	;;

    	2)	
	printf "\nExisting VMs configurations: \n"
	printf "*--------------------------------------------*\n"
            	ls "$CONFIG_DIR"/*.cfg | xargs -n1 basename   
	printf "*--------------------------------------------*\n"	
        printf "Enter the name of the VM configuration: " 
		read vm   
   
	# -f significa "¿Existe el archivo guardado en la variable $vm?"
        if [ -f "$CONFIG_DIR/$vm" ]; then            
		. "$CONFIG_DIR/$vm" 

		qemu-system-x86_64 \
			-enable-kvm \
		       	-m "$RAM" \
			-smp "$CPU" \
		       	-drive file="$DISK",format=qcow2 \
			-nic user,model=e1000,hostfwd=tcp::2222-:22 &
	else 
		printf "Virtual machine does not exist." 
	fi
    	;;

    	3)
	printf "\nExisting VMs configurations: \n"
	printf "*--------------------------------------------*\n"
		ls "$CONFIG_DIR"/*.cfg | xargs -n1 basename  
	printf "*--------------------------------------------*\n"
	printf "Enter the name of the VM configuration: \n" 
		read vmDEL

        if [ -f "$CONFIG_DIR/$vmDEL" ]; then 
		. "$CONFIG_DIR/$vmDEL"
                rm "$CONFIG_DIR/$vmDEL"
                rm "$DISK"
        else 
		printf " Virtual machine does not exist."
        fi
    	;;

    	0)
        clear
        exit 0
    	;;

    	*)
        printf "Order not found."
        sleep 2
    	;;
esac
done
