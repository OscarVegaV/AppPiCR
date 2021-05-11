# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby '2.7.2'

* System dependencies
"@fortawesome/fontawesome-free": "^5.15.3",
"@rails/actioncable": "^6.0.0",
"@rails/activestorage": "^6.0.0",
"@rails/ujs": "^6.0.0",
"@rails/webpacker": "5.2.1",
"bootstrap": "^4.6.0",
"install": "^0.13.0",
"jquery": "^3.6.0",
"popper.js": "^1.16.1",
"turbolinks": "^5.2.0",
"underscore": "^1.13.1"
# Introducción

Esta aplicacción "PiCR" escrita en Ruby on Rails tiene como objetivo principal ayudar a reactivar la economía, se trata de una aplicación donde el usuario toma sus fotos cuando visita parques nacionales, animales silvestres, lugares turísticos y zonas de Costa Rica.

En la web pueden haber muchas otras apps similares, pero PiCR hace la diferencia en incentivar a la economía nacional, ya que debido ala pandemia esta bastante golpeada.

PiCR es simple, su idea es que muestres lo que visitas, compartas tus imágenes, tu ubicación, para que otros visiten el lugar, y puedan vivir las mismas experiencias.

#Gemas 
postgresql   gem 'pg', '~> 1.1'
gem 'image_processing', '~> 1.2'
gem 'devise'
gem 'rails-erd'
gem 'geocoder'
gem 'gmaps4rails'
gem 'coffee-rails'
gem 'acts_as_favoritor'

# Modelos 
PiCR se ha configurado con 
los modelos:

- user: muestra los usuarios de nuestra aplicación. Utiliza la gema "devise". Para poder registrarse y ademas poder hacer login; utiliza la gema acts as favoritor para que pueda dale me gusta a las imágenes, fotos y comentarios.
tine:
has_one_attached :photo
has_many :pictures
has_many :comments, as: :commentable
acts_as_favoritor



- Place: son los lugares donde va el usuario. La idea es que el usuario comparta las ubicaciones donde se encuentre. Este modelo en especial utiliza la  gema 'geocoder'  para compartir la ubicación y hace una mancuerna con las gemas 'gmaps4rails' y  'coffee-rails' para que se puedan mostrar en el HTML.
tine:
has_many :pictures, dependent: :destroy
has_many :comments, as: :commentable, dependent: :destroy
geocoded_by :address
acts_as_favoritable


- Picture : este modelo ocupa que el usuario agregue la fotos de los lugares visitados y este hace uso de la gema 'image_processing'
tine:
belongs_to :user
has_many :comments, as: :commentable
belongs_to :place
has_one_attached :photo
acts_as_favoritable

- comment : permite crear comentarios a partir de los lugares y las fotos creadas por el usuario tiene:
belongs_to :user
belongs_to :commentable, polymorphic: true
acts_as_favoritable

-- favorite : este modelo, es el que nos sirve para que los usuarios puedan interactuar con un "me gusta" ya sea del lugar, las imágenes, y los comentarios. Pertenece a la gema 'acts_as_favoritor'

belongs_to :favoritable, polymorphic: true
belongs_to :favoritor, polymorphic: true

# Controladores

--places: este crud es el centro de la aplicación ya que aquí permite al usuario partir y empezar a crear, ademas que este utiliza la api de Google .

--Pictures su idea principal es que puedan crear imágenes a patir de los lugares.

--Comments este crud es muy simple la idea es que pueda comentar los lugares, fotos, 

--aplication: permite con un método  dar permiso a devise para que le usuarios puedan hacer sign up


# Dependencias 

para que esta aplicación se vea bien necesita bootstrap https://getbootstrap.com/docs/4.6/getting-started/introduction/

ademas de la plantilla offcanvas del bootstrap que se puede descargar en https://getbootstrap.com/docs/4.6/examples/

para que la gema erd pueda servir se necesita previamente instalado graphviz para que se puedan tener visualizado los grafos 
sudo apt-get install graphviz



para poder instalar las dependencias se utilizaron los siguientes comandos

> bundle install

	geocoder y gmaps4rails
> yarn install underscore
  
  bootstrap
> yarn add bootstrap@4.6.0
> yarn add jquery popper.js
> yarn add popper.js

  bootstrap y acts as favoritor
> yarn add @fortawesome/fontawesome-free.


historias de usuario en trello
historias implicitas 
https://trello.com/b/bZCBXM9p/picrimplicito

historias Explicitas
https://trello.com/b/cbnsfP5W/picrexplicito
