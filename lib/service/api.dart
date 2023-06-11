import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/response.dart';

class ApiImages {
  static Future<Response> fetchImages(String query, int page) async {
    String key = "36259510-7240acb947e1545cb3b70765a";
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=$key&orientation=vertical&per_page=12&q=$query&page=$page&image_type=photo'));

    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load images');
    }
  }
}



// return (
//       <>
//         <SearchForm onSubmit={this.onSubmit} />
//         {photos.length > 0 && <PhotosList photos={photos}/>}
//         {showBtn && <Button onClick={this.handleClick}>Load more...</Button>}
//         {isEmpty && (
//           <Text textAlign="center">Sorry. There are no images ... 😭</Text>
//         )}
//         {error && <Text textAlign="center">Sorry. {error} ... 😭</Text>}
//         {isLoading && <Loader/>}
//       </>
//     );