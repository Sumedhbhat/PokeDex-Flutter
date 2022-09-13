import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetail extends StatefulWidget {
  final pokemon;
  final Color color;
  final int heroTag;

  const PokemonDetail({super.key, required this.pokemon, required this.color, required this.heroTag});

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Scaffold(
       backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            left: 1,
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon:const Icon(Icons.arrow_back,color: Colors.white,size: 20,)),
          ),
          Positioned(
              top: 90,
              left: 20,
              child: Text(widget.pokemon['name'],style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white),)),
          Positioned(
              top: height*0.22,
              right: -40,
              child: Image.asset('images/pokeball.png',height: 200,fit: BoxFit.fitHeight)
          ),
          Positioned(
            bottom:0,
            child: Container(
              height: height*0.6,
              width: width,
              decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width*0.3,
                            child:const Text("Name",style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18
                            ),),
                          ),
                           Container(
                               width:width*0.3,
                               child: Text(widget.pokemon['name'],style:const TextStyle(color:Colors.black,fontSize: 18,
                               fontWeight: FontWeight.bold,

                               ),)),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width*0.3,
                            child:const Text("Weight",style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18
                            ),),
                          ),
                          Container(
                              width:width*0.3,
                              child: Text(widget.pokemon['weight'],style:const TextStyle(color:Colors.black,fontSize: 18,
                                fontWeight: FontWeight.bold,

                              ),)),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width*0.3,
                            child:const Text("Spawn Time",style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18
                            ),),
                          ),
                          Container(
                              width:width*0.3,
                              child: Text(widget.pokemon['spawn_time'],style:const TextStyle(color:Colors.black,fontSize: 18,
                                fontWeight: FontWeight.bold,

                              ),)),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width*0.3,
                            child:const Text("Weaknesses",style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18
                            ),),
                          ),
                          Container(

                              child: Text(widget.pokemon['weaknesses'].join(', '),style:const TextStyle(color:Colors.black,fontSize: 18,
                                fontWeight: FontWeight.bold,

                              ),)),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width*0.3,
                            child:const Text("Evolution",style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18
                            ),),
                          ),
                          widget.pokemon['next_evolution'] != null?
                          SizedBox(
                            height: 20,
                            width: width*0.55,

                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.pokemon['next_evolution'].length,
                                itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(widget.pokemon['next_evolution'][index]['name'],
                                    style:const TextStyle(color:Colors.black,fontSize: 18,
                                fontWeight: FontWeight.bold,)),
                              );
                            }),
                          ):
                            const Text("Maxed Out",style:
                            TextStyle(color:Colors.black,fontSize: 18,
                              fontWeight: FontWeight.bold,)
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width*0.3,
                            child:const Text("Previous Form",style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18
                            ),),
                          ),
                          widget.pokemon['prev_evolution'] != null?
                          SizedBox(
                            height: 20,
                            width: width*0.55,

                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.pokemon['prev_evolution'].length,
                                itemBuilder: (context,index){
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(widget.pokemon['prev_evolution'][index]['name'],
                                        style:const TextStyle(color:Colors.black,fontSize: 18,
                                          fontWeight: FontWeight.bold,)),
                                  );
                                }),
                          ):
                          const Text("Just Hatched",style:
                          TextStyle(color:Colors.black,fontSize: 18,
                            fontWeight: FontWeight.bold,)
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: (height*0.10)+100,
              left: width/2 - 100,
              child: CachedNetworkImage(
                imageUrl:widget.pokemon['img'],
                progressIndicatorBuilder: (context, url, downloadProgress) =>  CircularProgressIndicator(value: downloadProgress.progress,),
                errorWidget: (context, url, error) =>const Icon(Icons.error),
                height: 200,
                fit: BoxFit.fitHeight,
              )
          ),
          Positioned(
              top: 140,
              left: 25,
              child: Container(decoration:const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.black26,
              ), child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                child: Text(widget.pokemon['type'].join(','),style:const TextStyle(fontSize: 15,color: Colors.white),),
              )
              ),
          ),


        ],
      ),
    );
  }
}
