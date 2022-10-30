## Uni

lx2301 Lei Xu
## How to run this program

```
 $ bundle
 $ bundle exec rake db:migrate                                      
 $ rails server
```

## Progress Log

<details >
<summary>User Sign Up</summary>

#### Done
* Created a Users table in database using migration (new file "_create_users.rb" created in /db/migrate and I added few lines into it).
Then followed normal steps to update schema
```
 $ rails g model User uni:string:index password:string uname:string
 $ bundle exec rake db:migrate                                      
 $ rails server
```
* Added signup method in movies_controller
* Redefined create method in movies_controller to insert row into Users table
* To see what's inside the table users
```
$ rails db
$ .headers on
$ .mode columns    #(turn headers on and show database data in column mode )
$ .table
$ select * from users;
```

#### To DO:
- [X] Password validation (confirm your password)
- [ ] UNI cannot be null
- [ ] Show error message use @user.errors on signup if user already exists <a href="https://stackoverflow.com/a/23975918/19843708">StackOverflow</a>
- [ ] Write Cucumber
- [ ] Write Rspec tests
- [ ] Can check this: <a href="https://dev.to/kjdowns/creating-a-user-login-system-ruby-on-rails-2kl2">StackOverflow</a> for checking uid of logged-in user


</details>

<details>
<summary>User Sign In</summary>

#### Done
* Completed user signin funtion and password verification

#### To DO:
- [ ] Write Cucumber
- [ ] Write Rspec tests


</details>

<details>
<summary>Profile</summary>

#### Done
* Added six attributes to the Users table in database. (Run below six times)
```
 $ rails g model AddLionmailToUser lionmail:string
 $ bundle exec rake db:migrate                                      
```
* Created a profile page

#### To DO:
- [ ] Get User Id and use Update method to update user attributes in the database
- [ ] Write Cucumber
- [ ] Write Rspec tests


</details>