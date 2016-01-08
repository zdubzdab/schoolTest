/home/zdubzdab/Documents/jquery.countdown.package-2.0.2.zip# schoolTest
Test system for school

#Troubleshooting

##Postgres gem
If bundle install is fallen for `pg` try:
```sh
sudo apt-get install postgresql postgresql-contrib libpq-dev
```

**Create pg user**:
```sh
sudo -u postgres createuser pgs_root
```

**Set password**:
```sh
$ sudo -u postgres psql postgres
$ \password postgres #password for user postgres
```

##Project

```sh
$ rake db:create && db:migrate && db:seed
```

**Default admin**:
works after `db:seed`
```sh
email: admin.admin@gmail.com
password: 123123123
```
