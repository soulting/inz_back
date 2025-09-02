# coding: utf-8
# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# This test file is to fix the following error with services/identity_domains/tests/auto_created_sample_test/test_identity_domains_approval_workflow_step.py
# Error: Invalid value for '--type': invalid choice: default. (choose from escalation, regular)
# The only difference is that the value of --type is changed from 'default' to 'regular'.

import unittest
from tests import util
import vcr


none_mode_vcr = vcr.VCR(record_mode='none')


class Test_identity_domains_approval_workflow_step_CLI(unittest.TestCase):

    def setUp(self):
        pass

    @none_mode_vcr.use_cassette('invalid-file-path')
    def test_identity_domains_approval_workflow_step_create(self):
        params = [
            'identity-domains',
            'approval-workflow-step',
            'create',
            '--order', '1',
            '--schemas', '{}',
            '--type', 'regular',
            '--endpoint', 'https://region.domain.com',
        ]
        result = util.invoke_command(params)
        if 'Are you sure you want to' in result.output or 'Super user password cannot' in result.output:
            pass
        else:
            assert 'CannotOverwriteExistingCassetteException' in result.output

    @none_mode_vcr.use_cassette('invalid-file-path')
    def test_identity_domains_approval_workflow_step_get(self):
        params = [
            'identity-domains',
            'approval-workflow-step',
            'create',
            '--order', '1',
            '--schemas', '{}',
            '--type', 'regular',
            '--endpoint', 'https://region.domain.com',
        ]
        result = util.invoke_command(params)
        if 'Are you sure you want to' in result.output or 'Super user password cannot' in result.output:
            pass
        else:
            assert 'CannotOverwriteExistingCassetteException' in result.output
        params = [
            'identity-domains',
            'approval-workflow-step',
            'get',
            '--approval-workflow-step-id', 'approval_workflow_step_id',
            '--endpoint', 'https://region.domain.com',
        ]
        result = util.invoke_command(params)
        if 'Are you sure you want to' in result.output or 'Super user password cannot' in result.output:
            pass
        else:
            assert 'CannotOverwriteExistingCassetteException' in result.output

    @none_mode_vcr.use_cassette('invalid-file-path')
    def test_identity_domains_approval_workflow_step_patch(self):
        params = [
            'identity-domains',
            'approval-workflow-step',
            'create',
            '--order', '1',
            '--schemas', '{}',
            '--type', 'regular',
            '--endpoint', 'https://region.domain.com',
        ]
        result = util.invoke_command(params)
        if 'Are you sure you want to' in result.output or 'Super user password cannot' in result.output:
            pass
        else:
            assert 'CannotOverwriteExistingCassetteException' in result.output
        params = [
            'identity-domains',
            'approval-workflow-step',
            'patch',
            '--approval-workflow-step-id', 'approval_workflow_step_id',
            '--operations', '{}',
            '--schemas', '{}',
            '--endpoint', 'https://region.domain.com',
        ]
        result = util.invoke_command(params)
        if 'Are you sure you want to' in result.output or 'Super user password cannot' in result.output:
            pass
        else:
            assert 'CannotOverwriteExistingCassetteException' in result.output

    @none_mode_vcr.use_cassette('invalid-file-path')
    def test_identity_domains_approval_workflow_step_delete(self):
        params = [
            'identity-domains',
            'approval-workflow-step',
            'create',
            '--order', '1',
            '--schemas', '{}',
            '--type', 'regular',
            '--endpoint', 'https://region.domain.com',
        ]
        result = util.invoke_command(params)
        if 'Are you sure you want to' in result.output or 'Super user password cannot' in result.output:
            pass
        else:
            assert 'CannotOverwriteExistingCassetteException' in result.output
        params = [
            'identity-domains',
            'approval-workflow-step',
            'delete',
            '--approval-workflow-step-id', 'approval_workflow_step_id',
            '--endpoint', 'https://region.domain.com',
        ]
        result = util.invoke_command(params)
        if 'Are you sure you want to' in result.output or 'Super user password cannot' in result.output:
            pass
        else:
            assert 'CannotOverwriteExistingCassetteException' in result.output
