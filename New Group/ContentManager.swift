//
//  File.swift
//  TravelAgency3
//
//  Created by Nelson Penha on 2024-04-29.
//

import Foundation
import UIKit

// Struct para armazenar os dados da imagem e texto
struct ImageContent {
    let image: UIImage
    let description: String
    let labelText: String
}

// Classe para gerenciar o conteúdo das imagens
class ContentManager {
    static let shared = ContentManager() // Singleton para acesso global

    let contents: [ImageContent] = [
        ImageContent(image: UIImage(named: "Montreal")!, description: """
                         Here's a guide to ten must-see attractions and activities in Montreal, Canada, that a travel agency can offer to clients looking to explore this vibrant and culturally rich city:
                         
                         1. Old Montreal (Vieux-Montréal): Step back in time as you explore the historic streets of Old Montreal. This charming neighborhood is filled with cobblestone streets, boutiques, and landmarks such as the stunning Notre-Dame Basilica.
                         2. Mount Royal: This small mountain and park in the heart of the city offers panoramic views of Montreal. You can hike, bike, or simply enjoy a picnic at the summit while taking in the cityscape.
                         3. Montreal Botanical Garden (Jardin Botanique de Montréal): One of the world’s largest botanical gardens, it features themed gardens including the Chinese Garden and Japanese Garden, as well as a greenhouse full of exotic plants.
                         4. Montreal Museum of Fine Arts (Musée des beaux-arts de Montréal): With a vast collection of art spanning several millennia and continents, this museum is a must-visit for art lovers. It regularly hosts major international exhibitions.
                         5. Jean-Talon Market: One of the largest public markets in North America, Jean-Talon is bustling with vendors selling fruits, vegetables, flowers, spices, meats, and cheeses—all perfect for a taste of local life.
                         6. Saint Joseph's Oratory (Oratoire Saint-Joseph): This stunning basilica on Mount Royal is one of the city's iconic landmarks, known for its large dome and as a place of pilgrimage.
                         7. Plateau Mont-Royal: Explore this vibrant neighborhood known for its colorful murals, trendy shops, cafes, and the relaxed atmosphere of its leafy, residential streets.
                         8. Montreal Biodome (Biodôme de Montréal): Step into different ecosystems of the Americas in this unique facility where you can see a variety of animals and plants in replicas of their natural habitats.
                         9. Lachine Canal: Perfect for a leisurely bike ride or kayak trip, the Lachine Canal offers picturesque views along its paths and waterways, with plenty of spots for picnicking.
                         10. Montreal International Jazz Festival: If visiting in summer, don’t miss one of the largest jazz festivals in the world, where streets come alive with the sounds of jazz and crowds from around the globe.
""", labelText: "Montreal"),
        ImageContent(image: UIImage(named: "Toronto")!, description: """
                     Here is a guide to ten must-see attractions and activities in Toronto that can be a great addition to a travel agency's offerings:
                     
                     1. CN Tower: One of the world's tallest freestanding structures, the CN Tower offers breathtaking views from its observation decks and the thrilling EdgeWalk, where visitors can walk around the exterior ledge of the tower.
                     2. Royal Ontario Museum (ROM): This museum is one of the largest in North America, showcasing art, culture, and nature from around the globe and across the ages, including dinosaur exhibits and an extensive collection of indigenous Canadian artifacts.
                     3. Ripley’s Aquarium of Canada: Located at the base of the CN Tower, this aquarium features a large variety of marine life and an impressive underwater tunnel with a moving sidewalk, allowing visitors to experience sea creatures all around them.
                     4. Distillery District: A national historic site that has been transformed into a pedestrian-only village dedicated to arts, culture, and entertainment. The area is filled with charming boutiques, art galleries, and eateries set in beautifully preserved Victorian-era industrial architecture.
                     5. Toronto Islands: Just a short ferry ride from the downtown area, the Toronto Islands offer a great escape from the city with beautiful beaches, picnic areas, and recreational activities such as biking and canoeing.
                     6. Art Gallery of Ontario (AGO): One of the most distinguished art museums in North America, AGO hosts a vast collection of more than 90,000 works, including a large collection of Canadian art and an expansive array of European masterpieces.
                     7. St. Lawrence Market: Known as one of the world's best food markets, this vibrant hub of cuisine offers fresh produce, artisan cheeses, meats, and baked goods, as well as a variety of restaurants and food vendors.
                     8. High Park: Toronto's largest public park features many hiking trails, sports facilities, a beautiful lakefront, a zoo, and several playgrounds. The park is also known for its cherry blossoms that bloom in spring.
                     9. Casa Loma: This majestic castle is one of Toronto's most prominent historic landmarks, offering visitors a glimpse into the luxurious lifestyle of the early 20th century with its decorated suites, secret passages, an 800-foot tunnel, towers, stables, and beautiful gardens.
                     10. ockey Hall of Fame: An essential visit for sports fans, this museum is dedicated to the history of ice hockey with exhibits about players, teams, National Hockey League (NHL) records, and the Stanley Cup.
""", labelText: "Toronto"),
        ImageContent(image: UIImage(named: "SaoPaulo")!, description: """
                     Here’s a curated list of ten attractions and activities in São Paulo that a travel agency can offer to visitors looking to explore this vibrant city:
                     
                     1. Avenida Paulista: This iconic avenue is the heart of São Paulo's cultural scene, bustling with museums, art galleries, and cultural centers. It's also home to the São Paulo Museum of Art (MASP), known for its impressive collection and striking modernist architecture.
                     2. Ibirapuera Park: Often compared to Central Park in New York, Ibirapuera is not just a park but a cultural hub with museums, performance spaces, and beautifully landscaped gardens. It’s perfect for picnics, jogging, or enjoying outdoor concerts.
                     3. Mercado Municipal (Mercadão): This market is famous for its vast selection of fresh produce, meats, seafood, and gourmet products. Don’t miss the chance to try the renowned mortadella sandwich or the fresh pastel de bacalhau.
                     4. Pinacoteca do Estado: São Paulo’s oldest art museum offers a rich collection of Brazilian art, primarily from the 19th and 20th centuries, housed in a beautifully renovated 1900 building.
                     5. São Paulo Cathedral (Catedral da Sé): Located in the historic center, this neo-Gothic cathedral is a magnificent sight and one of the city’s most important religious sites.
                     6. Liberdade: This is the heart of the Japanese community in São Paulo, the largest Japanese community outside of Japan. The neighborhood is great for exploring street markets, authentic restaurants, and unique shops.
                     7. Football Museum (Museu do Futebol): Housed in the Pacaembu Stadium, this museum celebrates Brazil's deep love for football (soccer) with interactive exhibits and a rich history of the sport.
                     8. Beco do Batman (Batman Alley): An ever-changing outdoor gallery, this street in the Vila Madalena neighborhood is famed for its vibrant street art and graffiti, showcasing the work of local and international artists.
                     9. Municipal Theatre of São Paulo (Theatro Municipal): Inspired by the Paris Opera, this theater is a stunning piece of architecture and a major center for the performing arts, offering a variety of high-quality performances.
                     10. Oscar Freire Street: Known for its upscale boutiques, this is the place to shop for luxury goods. The street itself is beautifully designed and offers a pleasant walking experience with several cafes and restaurants to relax in.
""", labelText: "Sao Paulo"),
        ImageContent(image: UIImage(named: "Bogota")!, description: """
                     Here’s a guide to ten must-visit attractions and activities in Bogotá, Colombia, perfect for travelers looking to explore the city's rich culture, history, and natural beauty:
                     
                     1. Monserrate: Dominating Bogotá's skyline, this mountain offers breathtaking views of the city from its summit, accessible by cable car, funicular, or a hike. At the top, visitors can explore a historic church and dine in restaurants with panoramic views.
                     2. Gold Museum (Museo del Oro): This museum is one of Bogotá's most famous attractions, showcasing the largest collection of pre-Hispanic gold work in the world, with more than 55,000 pieces of gold and other materials from various indigenous cultures.
                     3. Botero Museum: Celebrating the work of Fernando Botero, Colombia’s most famous artist, this museum houses an impressive collection of his art, as well as pieces from his personal collection, including works by Picasso and Monet.
                     4. Plaza de Bolívar: The heart of historical Bogotá, this square is surrounded by landmarks such as the Primatial Cathedral, the Capitol Building, the Palace of Justice, and the Liévano Building, making it a must-visit for history enthusiasts.
                     5. Simón Bolívar Park: This vast urban park is ideal for picnics, jogging, and leisurely strolls. It also hosts concerts and events, offering a green escape in the heart of the city.
                     6. La Candelaria: The historic downtown neighborhood of La Candelaria is known for its colonial architecture, vibrant street art, museums, and theaters. Walking tours are highly recommended to fully appreciate the area's charms.
                     7. The Salt Cathedral of Zipaquirá: Located just outside of Bogotá, this underground church built within the tunnels of a salt mine is a unique architectural marvel and a place of pilgrimage.
                     8. Usaquén Flea Market: Visit on Sundays to explore the flea market where local artisans sell handmade crafts, antiques, and jewelry. The neighborhood is also filled with excellent restaurants and cozy cafes.
                     9. Jardín Botánico de Bogotá: Bogotá’s botanical garden is a showcase of Colombia's diverse flora, especially its many orchid and high-altitude plant species. It’s a peaceful place to learn about native plants and relax among nature.
                     10. National Museum of Colombia: As the oldest museum in the country, it holds a significant collection of artifacts, including items from Colombia’s pre-Columbian, colonial, and modern periods, providing insights into the rich history and cultural heritage of the nation.
""", labelText: "Bogota"),
        ImageContent(image: UIImage(named: "Caracas")!, description: """
                     Here’s a list of ten attractions and activities in Caracas, Venezuela, ideal for travelers looking to explore the city's cultural diversity, historical significance, and beautiful natural surroundings:
                     
                     1. Avila National Park (Parque Nacional El Ávila): Dominating the Caracas skyline, this mountainous park offers hiking, cable car rides, and spectacular views of the city below. It's a perfect escape for nature lovers and outdoor enthusiasts.
                     2. Museum of Contemporary Art of Caracas (Museo de Arte Contemporáneo): This museum features an impressive collection of modern and contemporary art from Venezuela and around the world, including works by famous artists like Picasso and Miró.
                     3. Plaza Bolívar: The main public square of Caracas, this historic area is surrounded by important government buildings and is a hub of activity. It's a great starting point for exploring the city's colonial architecture.
                     4. Birthplace of Simón Bolívar: Visit the house where Simón Bolívar, the liberator of several South American countries, was born. The museum inside offers insights into his life and the history of the region.
                     5. Caracas Cathedral: Located near Plaza Bolívar, this beautiful cathedral is an architectural marvel with significant religious and historical importance to the city.
                     6. El Hatillo: This charming colonial town, now a part of Caracas, is known for its colorful buildings, arts and crafts shops, and quaint cafes. It’s a picturesque spot to spend a relaxing day.
                     7. Children's Museum of Caracas (Museo de los Niños): A great place for families, this museum offers interactive exhibits designed to educate and entertain children through hands-on learning experiences.
                     8. Parque del Este: One of the most popular urban parks in Caracas, it features walking trails, a planetarium, a zoo, and beautifully landscaped gardens. It’s ideal for a morning jog or a leisurely afternoon.
                     9. Panteón Nacional: The final resting place of Simón Bolívar and other notable Venezuelans, this pantheon is not only a place of significant national pride but also a site of stunning architectural beauty.
                     10. Teleférico de Caracas: Take a cable car up to El Ávila Mountain for breathtaking views of the city and the Caribbean Sea. The ride itself is an experience, with opportunities to dine or hike at the top.
""", labelText: "Caracas"),
        ImageContent(image: UIImage(named: "Paris")!, description: """
                     Here's a list of ten top attractions and activities in Paris, France, perfect for travelers wanting to experience the romance, culture, and history of this iconic city:
                     
                     1. Eiffel Tower (Tour Eiffel): No visit to Paris is complete without a trip to the Eiffel Tower. Go up to its various viewing platforms for stunning cityscape views and dine at one of its restaurants for a truly memorable experience.
                     2. Louvre Museum (Musée du Louvre): Home to thousands of works of art, including the Mona Lisa and the Venus de Milo, the Louvre is a treasure trove of history and fine arts that is not to be missed.
                     3. Cathédrale Notre-Dame de Paris: Although damaged by fire in 2019, Notre-Dame remains a significant symbol of Paris. Visitors can admire the cathedral from the outside and learn about the ongoing restoration efforts.
                     4. Montmartre: Explore the quaint, artistic charm of Montmartre. Visit the stunning Sacré-Cœur Basilica, stroll through the artists' square, Place du Tertre, and perhaps catch a show at the legendary Moulin Rouge.
                     5. Champs-Élysées and Arc de Triomphe: Walk down the Champs-Élysées for shopping and people-watching, leading up to the Arc de Triomphe, which offers panoramic views from its rooftop.
                     6. Musée d'Orsay: Located in a grand former railway station, this museum houses the world’s largest collection of impressionist and post-impressionist masterpieces by artists such as Van Gogh, Monet, and many others.
                     7. Sainte-Chapelle: This royal chapel is known for its stunning stained glass windows, with 15 glass panels and a rose window depicting biblical scenes in rich detail and vibrant colors.
                     8. Luxembourg Gardens (Jardin du Luxembourg): Perfect for a leisurely stroll or a picnic, these beautiful gardens also feature a historic palace, which houses the French Senate.
                     9. Seine River Cruise: Take a cruise on the Seine River to enjoy a different perspective of the city’s most famous monuments lit up at night, such as the Eiffel Tower, Notre-Dame, and the Louvre.
                     10. Père Lachaise Cemetery: Visit the largest cemetery in Paris, known for its tombs of famous figures such as Oscar Wilde, Jim Morrison, and Edith Piaf. It's as much a walk through history as it is a peaceful green space.
""", labelText: "Paris"),
        ImageContent(image: UIImage(named: "Roma")!, description: """
                     Here's a list of ten must-visit attractions and activities in Rome, Italy, perfect for travelers looking to immerse themselves in the rich history, culture, and culinary delights of this ancient city:
                     
                     1. Colosseum (Colosseo): Start your Roman adventure with a visit to the iconic Colosseum, the largest ancient amphitheater ever built, where gladiators once battled for their lives. A guided tour can help you appreciate its history and architecture fully.
                     2. Vatican City: As the smallest independent state in the world, Vatican City is a must-see for its religious and artistic significance. Visit St. Peter's Basilica, the Sistine Chapel with Michelangelo's famous ceiling, and the extensive Vatican Museums.
                     3. Roman Forum (Foro Romano): Explore the heart of ancient Rome at the Roman Forum, a sprawling complex of ruined temples, basilicas, and vibrant public spaces that were once the center of Roman public life.
                     4.Trevi Fountain (Fontana di Trevi): Make sure to throw a coin into the Trevi Fountain, Rome’s largest and most famous Baroque fountain, which promises your return to the Eternal City.
                     5. Pantheon: This remarkably well-preserved monument of ancient Rome features a stunning dome and oculus that offer insights into the architectural ingenuity of the Romans. Originally a pagan temple, it now serves as a church.
                     6. Piazza Navona: Visit this elegant square, known for its three magnificent fountains, including Bernini’s famous Fountain of the Four Rivers, and surrounded by lively cafes and restaurants.
                     7. Spanish Steps (Scalinata di Trinità dei Monti): Climb the picturesque steps, enjoy a gelato, and soak in the vibrant atmosphere of this popular gathering spot, leading up to the beautiful Trinità dei Monti church.
                     8. Campo de' Fiori Market: Experience local life at Campo de' Fiori, a bustling market by day where you can find fresh produce and Italian delicacies. By night, the piazza turns into a lively social hub filled with people and outdoor dining.
                     9. Borghese Gallery and Gardens (Galleria Borghese): Reserve a spot to admire the Borghese Gallery’s collection of art, including works by Caravaggio, Bernini, and Titian, and enjoy a leisurely walk in the surrounding gardens.
                     10. Trastevere: Wander through the charming medieval streets of Trastevere, a picturesque neighborhood known for its lively nightlife, authentic trattorias, and the stunning Santa Maria in Trastevere Basilica.
""", labelText: "Roma"),
    ]
    
    
}
