## Uni

- Jiawen Chu:  jc5897
- Zeyu Zhang:  zz2941
- Shiyu Li:  sl4684
- Lei Xu:  lx2301

## How to run this program

```
 $ bundle
 $ bundle exec rake db:migrate                                      
 $ rails server
```


## How to test this program

if you want to run cucumber test:

```
$ bundle excu cucumber
```

if you want to run Rspec test:

```
$ bundle excu rspec
```

After running two kinds of test above, you can run ``index.html`` file to see the coverage. 
## Progress Log


<details >
<summary>User Sign Up</summary>
 <blockquote>
 <details >
  <summary>Done</summary>

 * Created a Users table in database using migration (new file "_create_users.rb" created in /db/migrate and I added few lines into it).
 Then followed normal steps to update schema
 ```
  $ rails g model User uni:string:index password:string uname:string (only run once)
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
 * Added "gem 'bcrypt'" into Gemfile, remember to run 'bundle install' before deploy!
 * Password validation (confirm your password)
 * UNI cannot be null
 * Show error message use @user.errors on signup if user already exists <a href="https://stackoverflow.com/a/23975918/19843708">StackOverflow</a>
 * Wrote Cucumber and Rspec tests

  </details>
 
#### To DO(next iteration):
- [ ] Only validate password_confirmation field when needed(only when creating an account or changing password) (use has_secure_password and change column 'password' to 'password_digest')

</blockquote>
</details>

<details>
<summary>User Sign In</summary>
<blockquote>
 
#### Done
* Completed user signin funtion and password verification
* Wrote cucumber test for user login
* Wrote Rspec test for user login
* deploy the product to heroku

#### To DO(next iteration):
None

</blockquote>
</details>

<details>
<summary>Profile</summary>
<blockquote>
 
#### Done
* Added six attributes to the Users table in database. (Run below six times and only run once) After the table is successfully built, it should not be run.
* Get User Id and use Update method to update user attributes in the database
* Create Course page and Profile page
* Link all pages together
* Write and Pass Cucumber and Rspec test
```
 $ rails g model AddLionmailToUser lionmail:string
 $ bundle exec rake db:migrate                                      
```
* Created a profile page

#### To DO (next iteration):
- [ ] Possible change the uni
- [ ] Possible do the checkbox rather than selection
- [ ] Check email format
- [ ] (If possible: only update fields that has input/ show original info when editing)
 </blockquote>
</details>

<details>
<summary>Group</summary>
 
#### To DO (next iteration):
- [ ] Can check this: <a href="https://dev.to/kjdowns/creating-a-user-login-system-ruby-on-rails-2kl2">StackOverflow</a> for checking uid of logged-in user
- [ ] Coverage for private user_params <a href="https://stackoverflow.com/questions/24292162/how-to-test-strong-params-with-rspec">How to test strong params with Rspec?</a>
 

 
</details>
