user_info() {
    echo -n "%{\e[105m%} %n@%m %{\e[0m%}"
}

directory() {
    echo -n "%{\e[104m%} %4~ %{\e[0m%}"
}

git_info() {
    # Check if current directory is (in) a git repo
    branch_name="$(git_current_branch)"
    if [ -n "$branch_name" ]; then
        # Default color is green
        echo -n "%{\e[102m%}"
        if [ -n "$(parse_git_dirty)" ]; then
            # If dirty, change color to red
            echo -n "%{\e[101m%}"
        fi
        # Finally print the name of the branch
        echo -n " $branch_name "

        # Check how far ahead repo is
        commits_ahead="$(git_commits_ahead)"
        if [ -n "$commits_ahead" ]; then
            # If ahead, print number of commits
            echo -n "%{\e[103m%} $commits_ahead "
        fi

        echo -n "%{\e[0m%}"
    fi
}

return_code() {
    echo -n "%(?..%{\e[97;41m%} %? %{\e[0m%})"
}

timestamp() {
    echo -n "%{\e[105m%} %D{%H:%M:%S} %{\e[0m%}"
}

PROMPT='$(timestamp)$(directory)$(git_info)$(return_code)
> '
