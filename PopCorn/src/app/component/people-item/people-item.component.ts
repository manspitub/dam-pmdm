import { Component, Input, OnInit } from '@angular/core';
import { PopularPeople } from 'src/app/interface/popular-people';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-people-item',
  templateUrl: './people-item.component.html',
  styleUrls: ['./people-item.component.css']
})
export class PeopleItemComponent implements OnInit {


  @Input() popularPeople!: PopularPeople;

  i:number = 0;
  constructor() { }

  ngOnInit(): void {
  }

  getPeopleImageUrl( popularPeople: PopularPeople ){
    return `${environment.imageBaseUrl}${popularPeople.profile_path}`;
  }

}
