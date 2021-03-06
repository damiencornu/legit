__legit_commit_push () {

    local currentBranch=`git rev-parse --abbrev-ref HEAD`
    local pendingCommits=`git log --branches --not --remotes --decorate --oneline`

    echo -e "${INFO}Now, we can try to push those file !";
    echo -e "${INFO}If your remote server is properly set, this will be easy peasy captain !";

    echo -e "${INVITE}Do you want to push ?";
    read -e doPush
    case $doPush in
        [yY]|[yY][eE][sS]) {
            clear
            git push
        };;
        [nN]|[nN][oO]) {
            echo -e "${INFO}Alright captain ! You're free to do that later by yourself";
            __legit_commit_pending
        };;
        *) {
            echo -e "${WARN}${LRED}You serious man ? type \"yes\" or \"no\" ... no big deal !${RESTORE}"
        };;
    esac
}