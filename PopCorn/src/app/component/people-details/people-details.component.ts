import { Component, Inject, Input, OnInit } from '@angular/core';
import { PersonResponse } from 'src/app/interface/person-details.interface';
import { PopularPeople } from 'src/app/interface/popular-people';
import { PopularPeopleService } from 'src/app/services/popular-people.service';
import { environment } from 'src/environments/environment';
import { PeopleItemComponent } from '../people-item/people-item.component';

@Component({
  selector: 'app-people-details',
  templateUrl: './people-details.component.html',
  styleUrls: ['./people-details.component.css']
})
export class PeopleDetailsComponent implements OnInit {
  @Input() person!: PersonResponse
  @Input() personInput!: PopularPeople;



  constructor(@Inject (PeopleItemComponent) private peopleService: PopularPeopleService, private peopleItem: PeopleItemComponent) { }

  ngOnInit(): void {
    console.log(this.person?.id)
      this.peopleService.getPerson(this.person?.id).subscribe(personResult=> {
        this.person = personResult;
      });
  }

  getPersonImageUrl( person: PersonResponse ){
    return `${environment.imageBaseUrl}${person.profile_path}`
  }

}
