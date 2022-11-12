## Uni

- Jiawen Chu:  jc5897
- Zeyu Zhang:  zz2941
- Shiyu Li:  sl4684
- Lei Xu:  lx2301

## How to run this program
- Heroku Link: https://w4152-mate.herokuapp.com/
- Download from git and run on ruby
```
 $ bundle
 $ bundle exec rake db:migrate                                      
 $ rails server
```
- If Database was created and you have modified it
```
$ bundle exec rake db:drop db:create db:migrate
$ bundle exec rake db:seed                                     
$ rails server
```


## How to test this program

if you want to run cucumber test:

```
$ bundle exec cucumber
```

if you want to run Rspec test:

```
$ bundle exec rspec
```

After running two kinds of test above, you can run ``index.html`` file to see the coverage. 
