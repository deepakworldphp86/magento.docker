#!/bin/bash
source '.env'
php -d memory_limit=-1 /var/www/html/"${MAGE_INSTALLATION_FOLDER}"/bin/magento admin:user:create --admin-user=${ADMIN_USER} --admin-password=${ADMIN_PASSWORD} --admin-email=${ADMIN_EMAIL} --admin-firstname=${ADMIN_FIRST_NAME} --admin-lastname=${ADMIN_LAST_NAME}

