# Code quality
Add static code analyzers to an Android project.

#### Code analyzers
- [PMD](https://pmd.github.io/)
- [Findbugs](http://findbugs.sourceforge.net/)
- [Checkstyle](http://checkstyle.sourceforge.net/)
- [Infer](http://fbinfer.com/)
- [Lint](https://developer.android.com/studio/write/lint.html)

## Install prerequisites
In order to properly work, ```node```, ```npm``` and ```browser-sync```. 

- Install [nodejs](https://nodejs.org/es/):
    - Linux:
        - ```curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -```
        - ```sudo apt-get install -y nodejs```
    - Mac:
        - ```brew install node```
- Install [Browsersync](https://browsersync.io/):
    - ```npm install -g browser-sync```

Place ```showQualityReports.sh``` and ```config``` in the project root.

Add to app build.gradle:
```
apply from: "${rootDir}/config/quality/checkstyle/codequality-checkstyle.gradle"
apply from: "${rootDir}/config/quality/findbugs/codequality-findbugs.gradle"
apply from: "${rootDir}/config/quality/pmd/codequality-pmd.gradle"
apply from: "${rootDir}/config/quality/infer/codequality-infer.gradle"
```

Add to app build.gradle, inside application tag:
``` 
lintOptions {
             //lint rules
             apply from: "${rootDir}/config/quality/lint/codequality-lint.gradle", to: it
             //locations for the rules and output
             lintConfig file("${rootDir}/config/quality/lint/lint-config.xml")
             htmlOutput file("${buildDir}/reports/lint/index.html")
             xmlOutput file("${buildDir}/reports/lint/index.xml")
}
```