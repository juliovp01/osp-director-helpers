#!/bin/bash

#SET THESE:
INTERNAL_VIP=
EXTERNAL_VIP=

source /home/stack/overcloudrc
keystone user-create --name sahara --pass sahara
keystone user-role-add --user sahara --role admin --tenant service
keystone service-create --name sahara --type data-processing --description "OpenStack Data Processing"
keystone endpoint-create --service sahara --publicurl 'http://${EXTERNAL_VIP}:8386/v1.1/%(tenant_id)s' --adminurl 'http://${INTERNAL_VIP}:8386/v1.1/%(tenant_id)s' --internalurl 'http://${INTERNAL_VIP}:8386/v1.1/%(tenant_id)s'
