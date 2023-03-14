# Contoh Project Rails

### Command yang sering digunakan


#### membuat aplikasi rails api
```bash
rails new <ProjectName> --api
```

#### membuat model
```bash
rails g model <ModelName>
```

#### melakukan migrasi
```bash
rails db:migrate
```

#### membuka rails console
```bash
rails console
```
atau
```bash
rails c
```

#### contoh file membuat table baru migrasi
```ruby
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
```

#### contoh migrasi menambahkan kolom ke table
```ruby
Class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
  end
end
```


#### contoh migrasi menghapus kolom dari table
```ruby
Class RemoveColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username
  end
end
```

#### contoh migrasi mengubah nama kolom
```ruby
Class RenameColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :username, :user_name
  end
end
```

#### contoh migrasi mengubah tipe data kolom
```ruby
Class ChangeColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :username, :string
  end
end
```

#### contoh migrasi mengubah nama table
```ruby
Class RenameTableFromUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :users, :user
  end
end
```

#### contoh migrasi menghapus table
```ruby
Class DropTableFromUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :users
  end
end
```


#### contoh cara membuat record 
```ruby
user = User.new
user.name = "Irfan Azhar"
user.save
```

#### contoh cara mengakses semua records dari sebuah model
```ruby
User.all
```

#### contoh cara mengakses record berdasarkan id
```ruby
User.find(1)
```

#### contoh cara menghapus record berdasarkan id
```ruby
User.find(1).destroy
```

#### contoh cara assign record yang berelasi
```ruby
user = User.find(1)
post = Post.find(1)
comment = Comment.find(1)
user.posts << post
comment.user = user
```

#### contoh instance method pada model
```ruby
class User < ApplicationRecord
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
```

#### contoh penggunaan instance method pada model
```ruby
user = User.find(1)
user.full_name
```

#### contoh class method pada model
```ruby
class User < ApplicationRecord
  def self.display_10_users
    User.limit(10)
  end
end
```

#### contoh penggunaan class method pada model
```ruby
User.display_10_users
```

#### beberapa method bawaan rails application record (model)
```ruby
User.all
User.find(1)
User.find_by(name: "Irfan Azhar")
User.find_by_name("Irfan Azhar")
User.where(name: "Irfan Azhar")
User.first
User.last
User.count
User.limit(10)
User.order(name: :asc)
User.order(name: :asc).limit(10).offset(10)
User.destroy_all
User.destroy(1)
User.destroy_by(name: "Irfan Azhar")
User.destroy_all(name: "Irfan Azhar")
User.update(1, name: "Irfan Azhar")
```

### menghapus (rollback) perubahan pada migration
```bash
rails db:rollback
```

atau
```bash
rails db:rollback STEP=2
```

#### menjalankan file seeds
```bash
rails db:seed
```

#### mereset database
```bash
rails db:reset
```


#### cara mengganti database menjadi postgresql
```bash
rails db:system:change --to=postgresql
```


#### cara membuat controller
```bash
rails g controller <path>/<ControllerName> 
```
contoh:
```bash
rails g controller api/v1/UsersController
```

#### menambahkan route baru
```ruby
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      post 'login', to: 'users#login'
    end
  end
end
```








