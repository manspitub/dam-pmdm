import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { CreatedListDto } from 'src/app/dto/createdList.dto';
import { AuthService } from 'src/app/services/auth.service';
import { PlaylistService } from 'src/app/services/playlist.service';

@Component({
  selector: 'app-dialog-create-list',
  templateUrl: './dialog-create-list.component.html',
  styleUrls: ['./dialog-create-list.component.css']
})
export class DialogCreateListComponent implements OnInit {

  listPost= new CreatedListDto;

  constructor(private router: Router, private authService: AuthService, private playlistService: PlaylistService) { }

  ngOnInit(): void {
  }

  createList(){
    this.playlistService.listPost(this.listPost).subscribe()
  }

  = new FormControl('listPost.name');

  description = new FormControl('listPost.description');

}
