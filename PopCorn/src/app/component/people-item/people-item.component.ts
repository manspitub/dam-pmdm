import { Component, Input, OnInit } from '@angular/core';
import { ImageResponse, Profile } from 'src/app/interface/image.interface';
import { PopularPeople } from 'src/app/interface/popular-people';

@Component({
  selector: 'app-people-item',
  templateUrl: './people-item.component.html',
  styleUrls: ['./people-item.component.css']
})
export class PeopleItemComponent implements OnInit {


  @Input() popularPeople!: PopularPeople;
  @Input() image!: ImageResponse;
  @Input() profile!: Profile;
  i:number = 0;
  constructor() { }

  ngOnInit(): void {
  }

}