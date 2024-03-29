# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
BookingDate.destroy_all
SpaceRating.destroy_all
Booking.destroy_all
User.destroy_all
Space.destroy_all
puts 'Creating users...'

file_path = Rails.root.join("app", "assets", "images", "toto.jpg") # Assurez-vous de spécifier le chemin correct
file = File.open(file_path)
user1 = User.new(email: "toto@gmail.com", password: "azerty")
user1.photo.attach(io: file, filename: "toto.jpg", content_type: "image/png")
user1.save!

file_path = Rails.root.join("app", "assets", "images", "sabrino.jpg") # Assurez-vous de spécifier le chemin correct
file = File.open(file_path)
user2 = User.new(email: "sabrino@gmail.com", password: "azerty", first_name: "sabrino", company_name: "Sanails")
user2.photo.attach(io: file, filename: "sabrino.com", content_type: "image/png")
user2.save!

file_path = Rails.root.join("app", "assets", "images", "claire.jpg") # Assurez-vous de spécifier le chemin correct
file = File.open(file_path)
user3 = User.new(email: "claire@gmail.com", password: "azerty", first_name: "claire", company_name: "Luna nails")
user3.photo.attach(io: file, filename: "claire.jpg", content_type: "image/png")
user3.save!

file_path = Rails.root.join("app", "assets", "images", "Samantho.jpg") # Assurez-vous de spécifier le chemin correct
file = File.open(file_path)
user4 = User.new(email: "samantho@gmail.com", password: "azerty", first_name: "samantho", company_name: "Noy Beauté")
user4.photo.attach(io: file, filename: "Samantho.jpg", content_type: "image/png")
user4.save!

file_path = Rails.root.join("app", "assets", "images", "colette.jpg") # Assurez-vous de spécifier le chemin correct
file = File.open(file_path)
user5 = User.new(email: "colette@gmail.com", password: "azerty", first_name: "colette", company_name: "Eclat divin")
user5.photo.attach(io: file, filename: "colette.jpg", content_type: "image/png")
user5.save!

url_image = ["https://res.cloudinary.com/planity/image/upload/q_auto,f_auto,w_1200,h_630/kcn2k8ivugyfg2uiqr6o",
  "https://www.beautedailleurs67.fr/img/cms/institut-beaute-ailleurs-soufflenheim-acceuil.jpg",
  "https://www.sparosedessables.fr/wp-content/uploads/2018/04/photo-salle.jpg",
  "https://institutprivilege.com/wp-content/uploads/2018/09/Institut-Privilege_accueil-1.jpg",
  "https://www.institut-beaute-amabel.fr/wp-content/uploads/2021/09/Amabel-accueil.jpg",
  "https://cdn1.treatwell.net/images/view/v2.i3865908.w720.h480.x4DA177EB/",
  "https://www.spaetc.fr/files/actualites/original/2016/03/10/codage3-5133.jpg",
  "https://www.lyonfemmes.com/media/images/lapart.jpg",
  "https://www.avantage-chomage.com/wp-content/uploads/2015/08/institut-beaute-pas-cher-Montpellier.jpg",
  "https://sf2.mariefrance.fr/wp-content/uploads/sites/5/2017/09/photo-18309-001-615x410.jpg",
  "https://www.institut-michelledefrance.com/wp-content/uploads/2022/09/T-room-Espace-Soins-des-mains.png",
  "https://uploads.lebonbon.fr/source/2018/paris/oct/b7593a38e6fb.jpg",
  "https://www.institut-spa-plaisirdessens.fr/wp-content/uploads/2019/07/media-24358053-012-820x490.jpg",
  "https://www.espace-concours.fr/uploads/2023/08/acheter-un-salon-de-coiffure-scaled.jpg",
  "https://www.mobiliercoiffure.com/wp-content/uploads/2021/01/pack-salon-coiffure-luxury.jpg",
  "https://www.leblogdudirigeant.com/wp-content/uploads/2021/01/fonds-de-commerce-pano-salon-coiffure-5-.png",
  "https://gammabrossfrance.fr/wp-content/uploads/2021/01/gamma-bross-france-salon-coiffure-le-concept-by-jen-dessioux-17.jpg",
  "https://www.mysalondecoiffure.com/img/cms/salon-de-coiffure-photo-guilherme-petri.jpg",
  "https://pipcke.fr/idees-deco/wp-content/uploads/2023/09/deco-salon-de-coiffure-dans-des-tons-pastel-fluo-avec-chaise-et-mobilier-vintage.jpeg",
  "https://www.coiffurekatica.fr/user/pages/16.zones-desservies/01.Toulouse/05.salon-de-coiffure-luxueux-a-polygone-montpellier/image_principale/salon-de-coiffure-luxueux-a-polygone-montpellier.jpg",
  "https://static.wixstatic.com/media/d464a6_0dd92febff704e9e9c84ee5e2abd8451~mv2_d_5153_3865_s_4_2.jpg/v1/crop/x_0,y_212,w_5153,h_3440/fill/w_534,h_338,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/LE%20SALON%20-%202%20-%20Facebook.jpg",
  "https://cdn1.treatwell.net/images/view/v2.i1690137.w1080.h720.x7E8AD42F/",
  "https://coiffeur-st-flour.fr/wp-content/uploads/2020/09/IMG_20200902_120102-1.jpg",
  "https://image.jimcdn.com/app/cms/image/transf/dimension=2048x2048:format=jpg/path/sde15cce8d948110a/image/i65a4f2d4ff0e2d97/version/1690985065/image.jpg",
  "https://www.mysalondecoiffure.com/img/cms/Comment%20am%C3%A9nager%20un%20petit%20salon%20de%20coiffure.jpg",
  "https://local-fr-public.s3.eu-west-3.amazonaws.com/prod/webtool/userfiles/9431/refonte/ELITE%20COIFFURE-21.jpg",
  "https://www.mysalondecoiffure.com/img/cms/Blog/pack-salon-coiffure-divine.jpg",
  "https://valessio-coiffeur-paris.fr/wp-content/uploads/2021/12/Valessio-salon-coiffeur-paris-17-1.jpg",
  "https://www.gouiran-beaute.com/lemag/wp-content/uploads/2019/10/decoration-salon-coiffure.jpg",
  "https://www.treizeenbeaute.fr/wp-content/uploads/2018/02/Int%C3%A9rieur-1.jpg",
  "https://www.tactill.com/uploads/slundre-salon-coiffure-design-deco-art-hairdresser.jpg",
  "https://www.mysalondecoiffure.com/img/cms/salon-de-barbier.jpg",
  "https://www.treizeenbeaute.fr/wp-content/uploads/2018/02/Int%C3%A9rieur-1.jpg",
  "https://media.vogue.fr/photos/5cbf0beb4ee68d4002bc0a51/master/pass/Coiffirst.png",
  "https://www.leblogdudirigeant.com/wp-content/uploads/2021/01/fonds-de-commerce-pano-salon-coiffure-5-.png",
  "https://i0.wp.com/hancoiffure.fr/wp-content/uploads/2022/09/HAN-COIFFURE-LE-SALON.jpg?fit=1000%2C667&ssl=1",
  "https://valessio-coiffeur-paris.fr/wp-content/uploads/2023/02/Coiffeur-paris-13IMG_2919-scaled.jpg",
  "https://www.malys-equipements.com/web/image/319983/trevis-salon-barbier.jpg?access_token=99890994-2009-4fc6-8fe9-3842f47246d3",
  "https://i0.wp.com/www.bigmoustache.com/blog/wp-content/uploads/2019/02/prestation-barbier.jpg?resize=1140%2C650&ssl=1",
  "https://www.spaetc.fr/files/envies/retina/2016/04/10/colorforever-20003-2842.jpg",
  "https://www.nateosante.com/wp-content/uploads/2019/12/Onglerie-institut-salon-beaute-quealite-air-purificateur-air-professionnel-nateosante-814x622.jpg",
  "https://www.espaceongles-corinnedomenech.fr/wp-content/uploads/2012/05/Photo-41-1_resultat.jpg",
  "https://cdn1.treatwell.net/images/view/v2.i3850340.w1080.h720.xACC55528/",
  "https://www.doitinparis.com/files/2021/beaute/adresses/instituts-de-beaute/06/instituts-de-beaute/instituts-de-beaute.jpg",
  "https://www.spaetc.fr/files/actualites/retina/2016/03/10/codage3-5133.jpg",
  "https://cdn1.treatwell.net/images/view/v2.i10002219.w1080.h720.x480D5904/https://cdn1.treatwell.net/images/view/v2.i10002219.w1080.h720.x480D5904/",
  "https://cdn1.treatwell.net/images/view/v2.i9868201.w1080.h720.x7B68768B/",
  "https://www.institut-spa-larochelle.com/images/institut1.jpg",
  "https://projets.cotemaison.fr/uploads/projects/7040/project_869205ae0aa06e313a_pic_1.jpg",
  "https://cdn1.treatwell.net/images/view/v2.i5207681.w720.h480.xD2600312/",
  "https://www.clippers-barbershop.fr/uploads/2/2021-01/pourquoi_est_il_necessaire_daller_chez_un_barbier.png",
  "https://www.modeandthecity.net/wp-content/uploads/2018/06/institut-darphin-1.jpg",
  "https://lespademelanie.fr/wp-content/uploads/2022/07/SPA-BD-3-1024x683.jpg.webp",
  "https://www.jasmineinstitute.fr/images/jasmine_0.jpg"]

puts 'Creating spaces...'

esthetique_marseille = Space.new(city: "Marseille", address: "21 rue Haxo, Marseille", space_profession: "Esthétique",
  description: "Salon marseillais proposant un espace pour exercer la prestation onglerie( gel, résine, chablon, vsm... Vous disposez d'un espace onglerie équipé : d'une table à manucure, deux chaises, lampe)
  L'espace dispose d'une étagère ainsi que d'une clim réversive et d'une connexion Wi-Fi En plus de votre clientèle ainsi celle du salon souhaitant cette prestation que je ne propose pas moi-même. (forte demande clientèle)
  Prestations pouvant être effectuées : Prothésie ongulaire.
  Il vous sera aussi autorise de dépose des affiches en vitrine (agenda ou tarification)
  Amplitude horaire : 10H - 19H",
  price_per_day: 75, price_per_week: 300, price_per_month: 990, user_id: user1.id)

3.times do
  file = URI.open(url_image.sample)
  esthetique_marseille.photos.attach(io: file, filename: "file_name")
end
esthetique_marseille.save!

coiffeur_cannes = Space.new(city: "Cannes", address: "41 Rue du Pré, Cannes", space_profession: "Coiffure",
  description: "Poste de coiffage tout équipé et ou poste de barbier disponibles sein de notre salon à Cannes. Mise à disposition de l'espace d'attente, machine à café, lave linge et sèche-linge.",
  price_per_day: 48, price_per_week: 200, price_per_month: 800, user_id: user1.id)

3.times do
  file_cannes = URI.open(url_image.sample)
  coiffeur_cannes.photos.attach(io: file_cannes, filename: "file_name")
end
coiffeur_cannes.save!

barbier_new = Space.new(city: "Niort", address: "20 rue Ricard, Niort", space_profession: "Barbier",
  description: "Poste de coiffage tout équipé et ou poste de barbier disponibles sein de notre salon à Niort. Mise à disposition de l'espace d'attente, machine à café, lave linge et sèche-linge.",
  price_per_day: 35, price_per_week: 150, price_per_month: 680, user_id: user1.id)

3.times do
  file_barbier = URI.open(url_image.sample)
  barbier_new.photos.attach(io: file_barbier, filename: "file_name")
end
barbier_new.save!

coiffeur_marseille = Space.new(city: "Marseille", address: "7 rue des dominicaines, Marseille", space_profession: "Coiffure",
  description: "Poste de coiffage tout équipé disponible au sein de notre salon à Marseille. Mise à disposition de l'espace d'attente, machine à café, lave linge et sèche-linge.",
  price_per_day: 55, price_per_week: 250, price_per_month: 890, user_id: user1.id)

3.times do
  file_coif = URI.open(url_image.sample)
  coiffeur_marseille.photos.attach(io: file_coif, filename: "file_name")
end
coiffeur_marseille.save!

barbier_marseille = Space.new(city: "Marseille", address: "120 Rue Jean Mermoz, Marseille", space_profession: "Barbier",
  description: "À louer à la journée secteur hyper centre.
  Accès au labo et à tous les espaces du salon.
  Wifi, musique d’ambiance, salon moderne bac à shampoing.",
  price_per_day: 80, price_per_week: 370, price_per_month: 990, user_id: user1.id)

3.times do
  file_barb = URI.open(url_image.sample)
  barbier_marseille.photos.attach(io: file_barb, filename: "file_name")
end
barbier_marseille.save!

esthetique_paris = Space.new(city: "Paris", address: "79 rue Saint Blaise, Paris", space_profession: "Esthétique",
  description: "Espace onglerie et poste de pédicurie dans salon en hyper centre très agréable, moderne musique d’ambiance climatisation réversible, wifi et ménage inclus",
  price_per_day: 75, price_per_week: 300, price_per_month: 990, user_id: user1.id)

3.times do
  file_esthe = URI.open(url_image.sample)
  esthetique_paris.photos.attach(io: file_esthe, filename: "file_name")
end
esthetique_paris.save!

esthetique_nantes = Space.new(city: "Nantes", address: "2 Rue des Marchandises, Nantes", space_profession: "Esthétique",
  description: "Loue cabine d’esthétique ou massage dans un très belle institut au centre de Nantes.
  • Services inclus : café-boisson, serviette-linge, accueil chaleureux pour votre clientèle.
  • Produits et ménage non inclus.
  Si vous êtes freelance, rejoignez un salon dynamique, joyeux et plein d’énergie.
  Profitez du wifi et de la musique d’ambiance.",
  price_per_day: 77, price_per_week: 300, price_per_month: 950, user_id: user1.id)

3.times do
  file_nantes = URI.open(url_image.sample)
  esthetique_nantes.photos.attach(io: file_nantes, filename: "file_name")
end
esthetique_nantes.save!

esthetique_marseille_2 = Space.new(city: "Marseille", address: "2 rue Haxo, Marseille", space_profession: "Esthétique",
  description: "Institut haut de gamme possédant un très bon portefeuille client. Spécialisé dans la Dermo esthétique nous recherchons 1 prestataire proposant une autre activité que les soins visages (Cils, ongles, blanchiment dentaires, Microneedling, Microbalding, Massages…). L’institut est situé à Marseille, pignon sur rue à proximité de commerces de qualité. Il n’y a aucune autre charge à payer uniquement la location mensuelle. Le local peut aussi se louer à la journée, à la semaine ou au mois.",
  price_per_day: 120, price_per_week: 450, price_per_month: 1500, user_id: user1.id)

3.times do
  file_esthe2 = URI.open(url_image.sample)
  esthetique_marseille_2.photos.attach(io: file_esthe2, filename: "file_name")
end
esthetique_marseille_2.save!

esthetique_nantes_2 = Space.new(city: "Nantes", address: "16-20 Rue des Rochettes, Nantes", space_profession: "Esthétique",
  description: "Espace esthétique idyllique au cœur de Nantes.
  Ce que nous mettons à votre disposition : deux postes pour accueillir deux free-lances, chacun équipé d’un espace dédié à la manucure et à la pédicure respectivement, comme le montre la photo.
  • Services inclus : café-boisson, serviette-linge, accueil chaleureux pour votre clientèle.
  • Produits et ménage non inclus.
  Si vous êtes freelance, rejoignez un salon dynamique, joyeux et plein d’énergie.
  Profitez du wifi et de la musique d’ambiance.",
  price_per_day: 88, price_per_week: 330, price_per_month: 880, user_id: user1.id)

3.times do
  file = URI.open(url_image.sample)
  esthetique_nantes_2.photos.attach(io: file, filename: "file_name")
end
esthetique_nantes_2.save!

esthetique_flip_2 = Space.new(city: "Paris", address: "30 rue Louis le Grand, Paris", space_profession: "Esthétique",
  description: "Espace esthétique idyllique au cœur de Paris, à 2 pas d'Opera.
  Ce que nous mettons à votre disposition : deux postes pour accueillir deux free-lances, chacun équipé d’un espace dédié à la manucure et à la pédicure respectivement, comme le montre la photo.
  • Services inclus : café-boisson, serviette-linge, accueil chaleureux pour votre clientèle.
  • Produits et ménage non inclus.
  Si vous êtes freelance, rejoignez un salon dynamique, joyeux et plein d’énergie.
  Profitez du wifi et de la musique d’ambiance.",
  price_per_day: 88, price_per_week: 330, price_per_month: 880, user_id: user1.id)

3.times do
  file = URI.open(url_image.sample)
  esthetique_flip_2.photos.attach(io: file, filename: "file_name")
end
esthetique_flip_2.save!

coiffure_lyon = Space.new(city: "Lyon", address: "53 Rue de Marseille, Lyon", space_profession: "Coiffure",
  description: "Salon de coiffure moderne situé en plein cœur de Lyon. Espace lumineux et convivial, équipé de tout le nécessaire pour accueillir votre clientèle. Wi-Fi gratuit et ambiance musicale.",
  price_per_day: 90, price_per_week: 400, price_per_month: 1100, user_id: user1.id)

3.times do
  file_lyon = URI.open(url_image.sample)
  coiffure_lyon.photos.attach(io: file_lyon, filename: "file_name")
end
coiffure_lyon.save!

barbier_toulouse = Space.new(city: "Toulouse", address: "15 Rue de la Bourse, Toulouse", space_profession: "Barbier",
  description: "Espace de barbier haut de gamme proposant un cadre élégant et moderne. Ambiance chaleureuse et équipements de qualité. Wifi disponible pour les clients.",
  price_per_day: 85, price_per_week: 380, price_per_month: 1050, user_id: user1.id)

3.times do
  file_toulouse = URI.open(url_image.sample)
  barbier_toulouse.photos.attach(io: file_toulouse, filename: "file_name")
end
barbier_toulouse.save!

esthetique_bordeaux = Space.new(city: "Mérignac", address: "8 Avenue des Frères Robinson, Mérignac", space_profession: "Esthétique",
  description: "Institut esthétique bien équipé au cœur de Bordeaux. Ambiance relaxante et professionnelle, idéale pour offrir à votre clientèle une expérience de soin unique. Wifi et musique d'ambiance inclus.",
  price_per_day: 80, price_per_week: 350, price_per_month: 1000, user_id: user1.id)

3.times do
  file_bordeaux = URI.open(url_image.sample)
  esthetique_bordeaux.photos.attach(io: file_bordeaux, filename: "file_name")
end
esthetique_bordeaux.save!

esthetik_carolus = Space.new(city: "Paris", address: "8 rue Blanche, Paris", space_profession: "Esthétique",
  description: "Institut esthétique moderne offrant une expérience de soins de qualité. Cadre relaxant et professionnel, idéal pour fidéliser votre clientèle. Wifi gratuit et ambiance musicale inclus.",
  price_per_day: 85, price_per_week: 370, price_per_month: 1050, user_id: user1.id)

3.times do
  file_montpellier = URI.open(url_image.sample)
  esthetik_carolus.photos.attach(io: file_montpellier, filename: "file_name")
end
esthetik_carolus.save!

coiffure_marseille = Space.new(city: "Marseille", address: "318 Av. du 24 Avril 1915, Marseille", space_profession: "Coiffure",
  description: "Salon de coiffure dynamique situé au cœur de Marseille. Ambiance conviviale et équipements professionnels pour satisfaire votre clientèle. Wifi disponible pour les clients.",
  price_per_day: 95, price_per_week: 420, price_per_month: 1150, user_id: user1.id)

3.times do
  file_marseille = URI.open(url_image.sample)
  coiffure_marseille.photos.attach(io: file_marseille, filename: "file_name")
end
coiffure_marseille.save!

barbier_paris = Space.new(city: "Paris", address: "20 rue Sedaine, Paris", space_profession: "Esthétique",
  description: "Institut esthétique haut de gamme situé dans le 11e arrondissement de Paris. Cadre raffiné et services de qualité pour satisfaire une clientèle exigeante. Wifi gratuit et ambiance relaxante.",
  price_per_day: 90, price_per_week: 400, price_per_month: 1100, user_id: user1.id)

3.times do
  file_paris = URI.open(url_image.sample)
  barbier_paris.photos.attach(io: file_paris, filename: "file_name")
end
barbier_paris.save!

esthetique_lyon = Space.new(city: "Lyon", address: "30 Cr de Verdun Perrache, Lyon", space_profession: "Esthétique",
  description: "Institut esthétique haut de gamme situé au cœur de Lyon. Cadre raffiné et services de qualité pour satisfaire une clientèle exigeante. Wifi gratuit et ambiance relaxante.",
  price_per_day: 80, price_per_week: 350, price_per_month: 1000, user_id: user1.id)

3.times do
  file_lyon = URI.open(url_image.sample)
  esthetique_lyon.photos.attach(io: file_lyon, filename: "file_name")
end
esthetique_lyon.save!

coiffure_bordeaux = Space.new(city: "Bordeaux", address: "172 Rue Jules Ferry, Bordeaux", space_profession: "Coiffure",
  description: "Salon de coiffure élégant situé au cœur de Bordeaux. Atmosphère chic et équipements de pointe pour offrir des services de coiffure de qualité. Wifi gratuit pour les clients.",
  price_per_day: 85, price_per_week: 380, price_per_month: 1050, user_id: user1.id)

3.times do
  file_bordeaux = URI.open(url_image.sample)
  coiffure_bordeaux.photos.attach(io: file_bordeaux, filename: "file_name")
end
coiffure_bordeaux.save!

space_marseille_1 = Space.new(city: "Marseille", address: "73 Rue de la République, 13002 Marseille", space_profession: "Coiffure",
  description: "Salon de coiffure moderne situé en plein cœur de Marseille, à proximité du Vieux-Port. Ambiance conviviale et services de qualité pour une expérience de coiffure exceptionnelle. Wifi gratuit disponible.",
  price_per_day: 95, price_per_week: 420, price_per_month: 1150, user_id: user1.id)

3.times do
  file_marseille_1 = URI.open(url_image.sample)
  space_marseille_1.photos.attach(io: file_marseille_1, filename: "file_name")
end
space_marseille_1.save!

space_marseille_2 = Space.new(city: "Marseille", address: "34 Rue de la Paix Marcel Paul, 13001 Marseille", space_profession: "Esthétique",
  description: "Institut esthétique moderne et chaleureux, situé dans le quartier animé de la Joliette à Marseille. Cadre relaxant et équipements de qualité pour offrir à votre clientèle une expérience de soin inoubliable. Wifi gratuit disponible.",
  price_per_day: 90, price_per_week: 400, price_per_month: 1100, user_id: user1.id)

3.times do
  file_marseille_2 = URI.open(url_image.sample)
  space_marseille_2.photos.attach(io: file_marseille_2, filename: "file_name")
end
space_marseille_2.save!

space_paris_2 = Space.new(city: "Paris", address: "30 rue Levert, 75020 Paris", space_profession: "Esthétique",
  description: "Institut esthétique moderne et chaleureux, situé dans le quartier animé d'Oberkampf à Paris. Cadre relaxant et équipements de qualité pour offrir à votre clientèle une expérience de soin inoubliable. Wifi gratuit disponible.",
  price_per_day: 90, price_per_week: 400, price_per_month: 1100, user_id: user1.id)

3.times do
  file_paris_2 = URI.open(url_image.sample)
  space_paris_2.photos.attach(io: file_paris_2, filename: "file_name")
end
space_paris_2.save!

space_marseille_3 = Space.new(city: "Marseille", address: "16 Quai de Rive Neuve, 13001 Marseille", space_profession: "Barbier",
  description: "Espace de barbier authentique et tendance, situé sur le Vieux-Port de Marseille. Cadre élégant et services de rasage de qualité pour une expérience unique. Wifi gratuit et ambiance musicale inclus.",
  price_per_day: 85, price_per_week: 380, price_per_month: 1050, user_id: user1.id)

3.times do
  file_marseille_3 = URI.open(url_image.sample)
  space_marseille_3.photos.attach(io: file_marseille_3, filename: "file_name")
end
space_marseille_3.save!

puts 'Finished!'
