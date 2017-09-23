import { Component, Input } from '@angular/core'
import { Missive }          from '../shared/missive'

@Component({
  selector:    'app-missive',
  templateUrl: 'missive.component.html',
  styleUrls:   [ 'missive.component.css' ]
})
export class MissiveComponent {
  @Input() 
  missive: Missive
}