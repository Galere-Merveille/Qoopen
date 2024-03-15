# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all if Rails.env.development?
Space.destroy_all if Rails.env.development?

puts 'Creating users...'
user1 = User.new(email: "toto@gmail.com", password: "azerty")
user1.save!

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
  "https://www.gouiran-beaute.com/lemag/wp-content/uploads/2019/10/decoration-salon-coiffure.jpg",
  "https://www.treizeenbeaute.fr/wp-content/uploads/2018/02/Int%C3%A9rieur-1.jpg",
  "https://www.tactill.com/uploads/slundre-salon-coiffure-design-deco-art-hairdresser.jpg",
  "https://www.mysalondecoiffure.com/img/cms/salon-de-barbier.jpg",
  "https://www.malys-equipements.com/web/image/319983/trevis-salon-barbier.jpg?access_token=99890994-2009-4fc6-8fe9-3842f47246d3",
  "https://i0.wp.com/www.bigmoustache.com/blog/wp-content/uploads/2019/02/prestation-barbier.jpg?resize=1140%2C650&ssl=1",
  "https://www.clippers-barbershop.fr/uploads/2/2021-01/pourquoi_est_il_necessaire_daller_chez_un_barbier.png"]

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
  description: "Poste de coiffage tout équipé et ou poste de barbier disponibles sein de notre salon à Marseille. Mise à disposition de l'espace d'attente, machine à café, lave linge et sèche-linge.",
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

esthetique_marseille_2 = Space.new(city: "Marseille", address: "2 rue Haxo, Marseille", space_profession: "Esthétique",
  description: "Institut haut de gamme possédant un très bon portefeuille client. Spécialisé dans la Dermo esthétique nous recherchons 1 prestataire proposant une autre activité que les soins visages (Cils, ongles, blanchiment dentaires, Microneedling, Microbalding, Massages…). L’institut est situé à Marseille, pignon sur rue à proximité de commerces de qualité. Il n’y a aucune autre charge à payer uniquement la location mensuelle. Le local peut aussi se louer à la journée, à la semaine ou au mois.",
  price_per_day: 120, price_per_week: 450, price_per_month: 1500, user_id: user1.id)

3.times do
  file_esthe2 = URI.open(url_image.sample)
  esthetique_marseille_2.photos.attach(io: file_esthe2, filename: "file_name")
end
esthetique_marseille_2.save!

puts 'Finished!'
