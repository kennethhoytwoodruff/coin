## Starfish Coin

### Community
The Starfish community uses [telegram](https://telegram.org/) as it's main messaging tool and utilizes the following communitites

  * [SF Ethereum Solidity Saturdays](https://t.me/sf_ethereum_ss)
  * [Starfish Bay Area Group](https://t.me/starfishnetwork)

## Getting Started

## Gitflow Process
 • Our master branch is always the version of the application which is running live. Our master branch is never touched or committed directly to.
 • The develop branch is the main working branch of the application for launching new features. We hardly ever make any commits directly to this branch much like master.
 • When creating or adding a new feature create a new branch and name it accordingly. When the work is finished submit a Pull Request or merge to the develop branch, review, and implement. All feature branches begin with the prefix feature     
Example: feature/posting
 • For fixing bugs or addressing issues please create a new branch and submit a pull request accordingly. All bug-fix branches begin with the prefix bug-fix
Example: bug-fix/discover-text
 The goal of this flow is optimize for code reviews and cleanliness. The more segmented and contained work we can do the better we can focus on the task at hand, accomplish it, and implement.
 For a more in-depth Gitflow understanding read here: https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow
 # Software requirements
+ [Node.js](https://nodejs.org/en/) v8.1.2 or higher
+ [Truffle.js](http://truffleframework.com/) v4.1.11 (core: 4.1.0)
```
$ npm -v
$ node -v
$ 
```


* Node
* Solidity
* 



### Working with this repository

* Clone the repository locally

` git clone https://github.com/StarfishMission/coin.git `


* Creating a branch

```
git checkout -b branchname
```

* Checking in your branch
`git push origin docs`

* Creating a pull request

* Merging a branch