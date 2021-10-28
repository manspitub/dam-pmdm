import { Component, OnInit } from '@angular/core';
import { PopularPeople } from 'src/app/interface/popular-people';
import { PopularPeopleService } from 'src/app/services/popular-people.service';

@Component({
  selector: 'app-popular-people',
  templateUrl: './popular-people.component.html',
  styleUrls: ['./popular-people.component.css']
})
export class PopularPeopleComponent implements OnInit {

  peopleList : PopularPeople[] = [];

  constructor(private popularPeopleService: PopularPeopleService) { }

  ngOnInit(): void {
    this.popularPeopleService.getPopularPeopleList().subscribe(result =>{
      this.peopleList = result.results
    })
  }


}
