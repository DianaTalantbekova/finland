import 'package:finland/models/finland_route.dart';

class FinlandRouteHelper {
  static FinlandRoute getFinlandRoute(String id) =>
      finlandRoutes.firstWhere((element) => element.id == id);

  static List<FinlandRoute> finlandRoutes = [
    FinlandRoute(
      id: '0',
      asset: 'assets/png/routes/image1.png',
      text: 'Helsinki and the Southern Coast',
      content: [
        'Start in Helsinki: Begin your Finnish adventure in the capital city, Helsinki. Explore the vibrant urban life, visit landmarks like the Helsinki Cathedral, and enjoy the city\'s culinary scene.',
        'Turku: Take a scenic journey to Turku, a historic city on the southwestern coast. Visit the Turku Castle and the Turku Archipelago, and don\'t miss the Aboa Vetus & Ars Nova museum.',
        'Archipelago Coast: Explore the stunning Archipelago Coast, known for its thousands of islands. You can embark on boat trips to remote islands, hike or cycle on picturesque trails, and enjoy the tranquility of the Baltic Sea.',
        'This itinerary provides a mix of city life and natural beauty, offering a taste of both urban and coastal Finnish experiences. You can also take ferries to some of the nearby islands, such as Suomenlinna or Seurasaari, if you have more time to spare.',
      ],
    ),
    FinlandRoute(
      id: '1',
      asset: 'assets/png/routes/image2.png',
      text: 'Northern Lights Adventure',
      content: [
        "Rovaniemi: Your journey begins in Rovaniemi, the capital of Lapland and the official hometown of Santa Claus. You'll have the opportunity to visit Santa Claus Village, where you can meet Santa and cross the Arctic Circle.",
        "Aurora Borealis Hunting: Northern Lights are the highlight of this trip. To maximize your chances of witnessing this natural spectacle, consider taking guided tours to remote locations with minimal light pollution, particularly during the winter months.",
        "Lapland's Winter Activities: Lapland is a winter wonderland offering a variety of activities such as dog sledding, snowmobiling, ice fishing, and cross-country skiing. The pristine snow-covered landscapes make it an ideal destination for winter sports and outdoor adventures.",
        "Snow Accommodations: Experience the unique thrill of staying in an ice hotel or a cozy glass-roofed igloo. These accommodations offer you the chance to gaze at the starry sky and potentially spot the Northern Lights from the comfort of your bed.",
        "This itinerary is perfect for those seeking the magical experience of the Northern Lights and a winter wonderland adventure. Be sure to check the best time for Northern Lights viewing, which is typically from late autumn to early spring, and dress warmly for the sub-zero temperatures of Lapland.",
      ],
    ),
    FinlandRoute(
      id: '2',
      asset: 'assets/png/routes/image1.png',
      text: 'Turku Archipelago Exploration',
      content: [
        "Turku: Your journey starts in the historic city of Turku, the oldest city in Finland. Explore the city's charming old town, visit the Turku Castle, and enjoy a mix of modern and traditional Finnish culture.",
        "Turku Archipelago: The Turku Archipelago is a unique cluster of thousands of islands, making it one of the world's most beautiful archipelagos. Take ferry rides to various islands, each with its own character and charm.",
        "Outdoor Activities: Engage in outdoor activities such as kayaking, sailing, and fishing in the archipelago's pristine waters. You can also explore the nature trails and enjoy picnics with breathtaking coastal views.",
        "Cottage Stays: Consider staying in a traditional Finnish cottage on one of the archipelago islands. These cottages often come equipped with saunas, allowing you to experience this quintessentially Finnish tradition.",
        "This itinerary offers a tranquil escape into the natural beauty of the Turku Archipelago, making it an ideal choice for those seeking a peaceful, nature-oriented getaway. Don't forget to taste local seafood dishes and interact with the friendly locals to get a sense of the archipelago's unique culture.",
      ],
    ),
    FinlandRoute(
      id: '3',
      asset: 'assets/png/routes/image4.png',
      text: 'Lapland and National Parks Adventure',
      content: [
        "Rovaniemi: Begin your adventure in Rovaniemi, the capital of Lapland. Visit Santa Claus Village, explore the Arctic Circle, and enjoy a range of winter activities. This city is a gateway to the magical world of Lapland.",
        "Pyhä-Luosto National Park: Head to Pyhä-Luosto National Park, where you can immerse yourself in the unspoiled Lapland wilderness. The park is known for its rugged landscapes, pristine forests, and excellent hiking trails.",
        "Outdoor Exploration: In Pyhä-Luosto, you can embark on various outdoor adventures, including snowshoeing, cross-country skiing, and snowmobiling during the winter months. In the summer, hiking, bird-watching, and gold panning are popular activities.",
        "Ammarnäs, Sweden: For a cross-border experience, consider traveling to Ammarnäs in Sweden, which offers similar stunning Lapland landscapes and opportunities for outdoor activities. Explore the wilderness, and if you're lucky, catch a glimpse of the Northern Lights.",
        "This itinerary is a dream for nature enthusiasts and adventure seekers, allowing you to experience the wild beauty of Lapland and the unique charm of the border region between Finland and Sweden. Be prepared for varying weather conditions and pack accordingly for the season in which you visit.",
      ],
    ),
    FinlandRoute(
      id: '4',
      asset: 'assets/png/routes/image5.png',
      text: 'Historical Tampere and Beyond',
      content: [
        "Tampere: Start your journey in Tampere, one of Finland's major cities. Tampere is known for its rich industrial history and vibrant cultural scene. Visit the Vapriikki Museum Centre, which offers insights into Finnish history and culture.",
        "Särkänniemi: Spend a day at the Särkänniemi Amusement Park, which features rides, an aquarium, a planetarium, and an observation tower. It's a great destination for families and anyone seeking fun and excitement.",
        "Pispala: Explore the historic district of Pispala, known for its colorful wooden houses and scenic views of Lake Pyhäjärvi. Take a leisurely walk along the ridge and enjoy the atmosphere of this charming area.",
        "Hiking and Nature: For a touch of nature, consider a visit to Seitseminen National Park, located a short drive from Tampere. The park offers excellent hiking trails, old-growth forests, and serene lakes.",
        "This itinerary blends cultural exploration with entertainment and natural beauty. Tampere is a city of contrasts, with a mix of industrial history and modern attractions, making it a well-rounded destination for travelers of all interests. Be sure to check the operating hours and seasons for specific attractions.",
      ],
    ),
    FinlandRoute(
      id: '5',
      asset: 'assets/png/routes/image6.png',
      text: 'Exploring Eastern Finland and Lake Saimaa',
      content: [
        "Lake Saimaa: Begin your journey by heading to Lake Saimaa, which is one of the largest freshwater lakes in Europe. The lake and its surrounding areas offer numerous opportunities for water-based activities and relaxation.",
        "Savonlinna: Visit the charming town of Savonlinna, known for its stunning Olavinlinna Castle. The castle hosts the annual Savonlinna Opera Festival, making it a cultural hub in the region.",
        "Linnansaari National Park: Explore Linnansaari National Park, a group of islands in Lake Saimaa, and home to the endangered Saimaa ringed seal. You can hike, kayak, and witness the unique wildlife of the area.",
        "Puumala Archipelago: Experience the Puumala Archipelago, known for its picturesque landscapes and tranquility. Take a boat tour to explore the numerous islands and enjoy the natural beauty of this region.",
        "This itinerary provides an enchanting journey through Eastern Finland, where you'll be surrounded by the serene beauty of Lake Saimaa and have the opportunity to explore historical sites and pristine natural areas. Be sure to check for any local events, particularly in Savonlinna, and enjoy the local cuisine, including freshly caught fish from the lake.",
      ],
    ),
    FinlandRoute(
      id: '6',
      asset: 'assets/png/routes/image7.png',
      text: 'Journey through the Land of Kalevala',
      content: [
        "Karelia: Begin your adventure in the region of Karelia, which is steeped in folklore and known as the land of Kalevala, the epic poem that is central to Finnish mythology. This region is rich in cultural heritage.",
        "Petrazavodsk: Visit the city of Petrozavodsk in Russian Karelia, known for its blend of Russian and Karelian cultures. Explore the city's museums and enjoy Karelian cuisine.",
        "Karelian Villages: Explore traditional Karelian villages, where you can experience the local way of life, sample traditional foods like Karelian pasties (karjalanpiirakka), and learn about the region's unique cultural traditions.",
        "Kalevala National Park: Head to Kalevala National Park, which is named after the epic poem and is home to pristine natural beauty. You can hike, camp, and enjoy the tranquility of the wilderness.",
        "This itinerary offers a unique opportunity to immerse yourself in Finnish folklore and cultural traditions while exploring the natural beauty of Karelia. Remember to check visa requirements if you plan to cross the border into Russian Karelia and consider the best time to visit the national park based on your preferred activities and weather conditions.",
      ],
    ),
    FinlandRoute(
      id: '7',
      asset: 'assets/png/routes/image8.png',
      text: 'Ahtarji Lakes and Sami Culture',
      content: [
        "Ahtarji Lakes: Begin your journey in the Ahtarji Lakes region, which includes Lake Inari (Ahtarji in Sami), one of the largest lakes in Finland. The crystal-clear waters and the surrounding wilderness offer a serene escape.",
        "Sámi Culture: Take the opportunity to learn about the indigenous Sámi culture. Visit the Sámi Siida Museum in Inari to gain insights into their traditions, handicrafts, and the unique connection they have with the Arctic environment.",
        "Reindeer Experiences: Engage in reindeer-related activities, such as reindeer sledding or attending a Sámi reindeer herding demonstration. Reindeer are a central part of the Sámi way of life.",
        "Sámi Handicrafts: Explore local markets and shops to purchase authentic Sámi handicrafts, such as intricately woven textiles and jewelry. These items make for meaningful souvenirs.",
        "This itinerary allows you to delve into the indigenous culture of the Sámi people and immerse yourself in the pristine natural beauty of the Ahtarji Lakes region. Remember to respect and honor the cultural heritage of the Sámi people during your visit. Also, be sure to check the seasonal activities and experiences available, as they can vary throughout the year.",
      ],
    ),
    FinlandRoute(
      id: '8',
      asset: 'assets/png/routes/image9.png',
      text: 'Western Coast and the Åland Islands',
      content: [
        "Turku: Begin your journey in Turku, a city on the southwest coast of Finland. Explore its historic center, visit the Turku Castle, and enjoy the lively atmosphere along the Aura River.",
        "Archipelago Road: Embark on a road trip along the Archipelago Road, a scenic route that winds through the stunning Åland archipelago. You'll encounter numerous bridges and ferries as you hop from island to island.",
        "Åland Islands: Spend time on the Åland Islands, an autonomous region of Finland known for its maritime culture. Visit the Maritime Museum and enjoy sailing, kayaking, and biking on the islands.",
        "Mariehamn: Explore the capital of Åland, Mariehamn. Stroll along the Esplanade, visit museums like the Åland Museum, and experience the town's unique blend of Swedish and Finnish influences.",
        "This itinerary offers a coastal adventure, taking you through picturesque archipelagos and allowing you to explore the unique Åland Islands with their distinct cultural and linguistic characteristics. Be sure to take advantage of the maritime activities and enjoy the local cuisine, which often features fresh seafood.",
      ],
    ),
    FinlandRoute(
      id: '9',
      asset: 'assets/png/routes/image10.png',
      text: 'Koli National Park Hiking and Outdoor Adventure',
      content: [
        "Koli National Park: Your adventure begins in Koli National Park, located in North Karelia. This national park is renowned for its rugged landscapes, rolling hills, and breathtaking vistas overlooking Lake Pielinen.",
        "Hiking Trails: Explore the numerous hiking trails in Koli National Park, such as the Ukko-Koli and Akka-Koli trails. These trails offer opportunities for both leisurely walks and more challenging hikes, all with stunning viewpoints.",
        "Winter Activities: If visiting during the winter, enjoy snow sports like cross-country skiing and snowshoeing. Koli offers some of the best winter experiences in Finland.",
        "Photography and Nature Observation: Koli is a haven for nature photographers and wildlife enthusiasts. Keep an eye out for local fauna, and capture the ever-changing colors of the landscape.",
        "This itinerary is ideal for outdoor enthusiasts and nature lovers. Koli National Park is a year-round destination with its own unique charm in every season. Ensure you are adequately prepared for your chosen outdoor activities, whether it's hiking, skiing, or photography, and enjoy the pristine beauty of this national park.",
      ],
    ),
  ];
}
