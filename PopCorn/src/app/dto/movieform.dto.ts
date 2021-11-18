export class MovieFormDto{
  title: string;
  overview: string
  vote_average: string;

  constructor(){
    this.title=''
    this.overview=''
    this.vote_average=''
  }
}
