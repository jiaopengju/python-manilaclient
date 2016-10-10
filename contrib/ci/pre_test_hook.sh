#!/bin/bash -xe
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

# This script is executed inside pre_test_hook function in devstack gate.

# Run manila's pre_test_hook.sh script first
source $BASE/new/manila/contrib/ci/pre_test_hook.sh True generic multibackend

localrc_path=$BASE/new/devstack/localrc

# Set big quota for share networks to avoid limit exceedances
echo "MANILA_OPTGROUP_DEFAULT_quota_share_networks=50" >> $localrc_path

# Enable and use only v3 of Identity API
echo "IDENTITY_API_VERSION=3" >> $localrc_path
echo "ENABLE_IDENTITY_V2=False" >> $localrc_path
