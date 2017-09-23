import { Component, Input, OnInit } from '@angular/core'
import { Castle }                   from '../shared/castle'

@Component({
  selector:    'app-castles',
  templateUrl: 'castles.component.html',
  styleUrls:   [ 'castles.component.css' ]
})
export class CastlesComponent {
  @Input() 
  castles: Castle[]
}
