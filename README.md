
<details open>
<summary>Signup - Jiawen</summary>

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

#### To DO:
- [ ] Password validation (confirm your password)
- [ ] Show error message use @user.errors on signup if user already exists <a href="https://stackoverflow.com/a/23975918/19843708">StackOverflow</a>
- [ ] Write Cucumber
- [ ] Write Rspec tests
</details>