Git is quite an awesome version control system. Why? Because it’s lightning fast, even for large projects (among other reasons).

But, how do you use Git effectively for development on a daily basis? Let me explain to you.

Branches

With git you normally have a ‘master’ branch. This is also the branch you use to sync your code with other repositories. That is also the reason why you should never code in the ‘master’ branch. Always create a new branch and develop your code there.

$ git checkout -b new_feature
# add, commit, repeat
Rebase

Now, while you are working hard on your new feature, other developers complete theirs and push their changes to the remote master branch. When you’re done with your project, you need to first get the most recent version of the project’s code.

$ git checkout master
$ git pull
Now, to make merging your new feature easy, you should rebase your new_feature_branch. What this does is add all the commits you just pulled in to your new_feature branch. Any conflicts that arise will happen in your new_feature branch as well, leaving your master branch clean and in order.

$ git checkout new_feature
$ git rebase master
Merge

Now, you have resolved all (if any) conflicts with the current code and your new_feature, you can now merge your new_feature into the project’s master branch without any problems.

$ git checkout master
$ git merge new_feature
This will create a new commit, containing your new_feature. Now is also the time to push your changes to the remote repository.

$ git push origin master
What’s next?

More often than not, you’ll encounter conflicts when running rebase. That’s okay, but you’ll need to know how to approach a situation like that. I’ll spend another blog post on that topic later.

Need Git training?

I’m currently available to provide on-location Git training. Please contact me for more info.