#!/bin/bash
clear

if [ "$1" == "-full" ]
then
	echo "*********************** Upgrading setup - setup:upgrade ****************************" 
	php -d memory_limit=-1 /var/www/html/${MAGE_INSTALLATION_FOLDER}/bin/magento setup:upgrade
	echo "*********************** Setup compile - setup:di:compile *******************************" 
	php -d memory_limit=-1 /var/www/html/${MAGE_INSTALLATION_FOLDER}/bin/magento setup:di:compile
	echo "*********************** setup reindex - indexer:reindex ********************************"
	php -d memory_limit=-1 /var/www/html/${MAGE_INSTALLATION_FOLDER}/bin/magento indexer:reindex
	echo "*********************** setup static content deploy - setup:static-content:deploy -f  *******************" 
	php -d memory_limit=-1 /var/www/html/${MAGE_INSTALLATION_FOLDER}/bin/magento setup:static-content:deploy -f
	echo "*********************** Permission ***********************************************"
  chmod -R 777 /var/www/html/${MAGE_INSTALLATION_FOLDER}/
fi

if [ "$1" == "-full_no_index" ]
then

	echo "*********************** Upgrading setup - setup:upgrade ****************************"
	php -d memory_limit=-1 /var/www/html/${MAGE_INSTALLATION_FOLDER}/bin/magento setup:upgrade
  echo "*********************** Setup compile - setup:di:compile *******************************"
  php -d memory_limit=-1 /var/www/html/${MAGE_INSTALLATION_FOLDER}/bin/magento setup:di:compile
	echo "*********************** setup static content deploy - setup:static-content:deploy -f  *******************"
	php -d memory_limit=-1 /var/www/html/${MAGE_INSTALLATION_FOLDER}/bin/magento setup:static-content:deploy -f
	echo "*********************** Permission ***********************************************"
  chmod -R 777 /var/www/html/${MAGE_INSTALLATION_FOLDER}/
fi

if [ "$1" == "-compile" ]
then

	echo "*********************** Setup compile - setup:di:compile *******************************" 
	php -d memory_limit=-1 /var/www/html/${MAGE_INSTALLATION_FOLDER}/bin/magento setup:di:compile
	echo "*********************** Permission ***********************************************"
  chmod -R 777 /var/www/html/${MAGE_INSTALLATION_FOLDER}/
fi
if [ "$1" == "-index" ]
then

	echo "*********************** setup reindex - indexer:reindex ********************************"
	php -d memory_limit=-1 /var/www/html/${MAGE_INSTALLATION_FOLDER}/bin/magento indexer:reindex
	echo "*********************** Permission ***********************************************"
  chmod -R 777 /var/www/html/${MAGE_INSTALLATION_FOLDER}/
fi
if [ "$1" == "-content" ]
then

	echo "*********************** setup static content deploy - setup:static-content:deploy -f  *******************" 
	php -d memory_limit=-1 /var/www/html/${MAGE_INSTALLATION_FOLDER}/bin/magento setup:static-content:deploy -f
	echo "*********************** Permission ***********************************************"
  chmod -R 777 /var/www/html/${MAGE_INSTALLATION_FOLDER}/
fi
if [ "$1" == "-upgrade_content" ]
then

	echo "*********************** Upgrading setup - setup:upgrade ****************************" 
	php -d memory_limit=-1 /var/www/html/${MAGE_INSTALLATION_FOLDER}/bin/magento setup:upgrade
	echo "*********************** setup static content deploy - setup:static-content:deploy -f  *******************" 
	php -d memory_limit=-1 /var/www/html/${MAGE_INSTALLATION_FOLDER}/bin/magento setup:static-content:deploy -f
	echo "*********************** Permission ***********************************************"
  chmod -R 777 /var/www/html/${MAGE_INSTALLATION_FOLDER}/
fi
if [ "$1" == "-permission" ]
then

	echo "*********************** Giving Permission *******************" 
	chmod -R 777 /var/www/html/${MAGE_INSTALLATION_FOLDER}/
	echo "*********************** Ending Permission *******************" 

fi

if [ "$1" == "-help" ]
then
	echo -e "Full Deploy   =>>>   { deploy.sh -full }"
	echo -e "Full Deploy No Index   =>>>   { deploy.sh -full_no_index }"
	echo -e "Setup upgrade =>>>   { deploy.sh -upgrade_content }"
  echo -e "Setup Index =>>>     { deploy.sh -index }"
	echo -e "Setup Deploy =>>>    { deploy.sh -compile }"
	echo -e "Permission =>>>      { deploy.sh -permission }"
	echo -e "Upgrade Content =>>> { deploy.sh -content }"
fi

exit 1
