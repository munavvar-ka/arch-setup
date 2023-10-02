#!/bin/bash 
if  [ ! -d ~/.aur-pkgs ]
then
	mkdir ~/.aur-pkgs;
fi

case ${1} in  
    'install')  
    	for package in "${@:2}"
	do
		printf "\n\e[0;32;1;196mInstalling package ${package}\e[0;196m\n"; 
		cd ~/.aur-pkgs;
		if [ -d ./$package ]
		then
			cd ~/.aur-pkgs/$package;
			git pull;
		else
			git clone "https://aur.archlinux.org/${package}.git";
			cd ~/.aur-pkgs/$package;
		fi
        	printf "\n\e[0;32;1;5;196mInstalling package\e[0;196m\n"; 
		if makepkg -i
		then
			printf "\n\e[0;32;2;196m${package} has been installed\e[0;196m\n"; 
		else
			printf "\n\n\e[0;33;1;196mHave some issues with the ${package} installation\e[0;196m\n"; 
			exit;
		fi
	done
        ;;  
    'update')  
        printf "\nUpdating aur packages\n";  
    	for package in ~/.aur-pkgs/*;
	do
		printf "\n\e[0;32;1;196mUpdating package - ${package}\e[0;196m\n"; 
		cd $package;
		if git pull
		then
        		printf "\n\e[0;32;1;5;196mInstalling new changes\e[0;196m\n"; 
			if makepkg -i
			then
				printf "\n\e[0;32;2;196m${package} has been installed\e[0;196m\n"; 
			else
				printf "\n\e[0;33;1;196mHave some issues with the ${package} installation\e[0;196m\n"; 
				exit;
			fi
		else
        		printf "\n\e[0;33;1;196m${package} is already uptodate\e[0;196m\n"
		fi
	done
        ;;
    *)  
        printf "\nAction must be specified\n"
        ;;  
esac  