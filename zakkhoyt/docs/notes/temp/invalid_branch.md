

bundle exec fastlane slack_notify_invalid_branch \
    github_username:"zakkhoyt" \
    branch_name:"some/fake/branch" \
    allowed_branches:"release/**/**, hotfix/**/**" \
    workflow_file:".github/workflows/fakeWorkflow.yml" \
    workflow_name:"Fake Workflow" \
    channel:"#ios_testing" \
    slack_webhook:"$HATCH_SLACK_TESTING"



slack_webhook:"$HATCH_SLACK_TESTING"

# Run workflow
gh workflow run devLocalRunner.yml \
    --ref `gbc` \
    -f runner_label=ios-ci 

# Print URL of workflow run
gh run list --workflow=devLocalRunner.yml --json url --jq '.[0].url' | cat



GH_WORKFLOW=devLocalRunner.yml
# Run workflow
gh workflow run $GH_WORKFLOW \
    --ref `gbc` \
    -f runner_label=ios-ci 

# Print URL of workflow run
GH_WORKFLOW_RUN_URL=$(gh run list --workflow=$GH_WORKFLOW --json url --jq '.[0].url' | cat)
echo $GH_WORKFLOW_RUN_URL
open $GH_WORKFLOW_RUN_URL

