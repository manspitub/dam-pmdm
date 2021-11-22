export class CreatedListDto{
  name: string;
  description: string
  language: string;

  constructor(){
    this.name=''
    this.description=''
    this.language='en'
  }
}
