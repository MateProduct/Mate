
<details open>
## Uni

lx2301 Lei Xu
## How to run this program

```
 $ bundle
 $ bundle exec rake db:migrate                                      
 $ rails server
```

## Progress Log
</details>

<details open>
<summary>Signup - Jiawen</summary>

#### Done
* Created a Users table in database using migration (new file "_create_users.rb" created in /db/migrate and I added few lines into it).
Then followed normal steps to update schema
```
 $ rails g model User uni:string:index password:string uname:string (only run once)
 $ bundle exec rake db:migrate                                      
 $ rails server
```
* Added signup method in movies_controller
* Redefined create method in movies_controller to insert row into Users table

#### To DO:
- [ ] Password validation (confirm your password)
- [ ] Show error message use @user.errors on signup if user already exists <a href="https://stackoverflow.com/a/23975918/19843708">StackOverflow</a>
- [ ] Write Cucumber
- [ ] Write Rspec tests


</details>

<details open>
<summary>User Sign In</summary>

#### Done
* Completed user signin funtion and password verification

#### To DO:
- [ ] Write Cucumber
- [ ] Write Rspec tests


</details>

<details open>
<summary>Profile</summary>

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
</details>