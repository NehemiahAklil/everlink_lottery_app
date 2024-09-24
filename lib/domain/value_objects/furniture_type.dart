enum FurnitureType {
  sofa(fname: 'Sofa'),
  tvStand(fname: 'Tv Stand'),
  diningTable(fname: 'Dinning Table'),
  kitchenCabinet(fname: 'Kitchen Cabinet');

  const FurnitureType({required this.fname});
  final String fname;
}
