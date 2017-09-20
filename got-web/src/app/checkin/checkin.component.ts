import { Component, Input, Output, EventEmitter } from '@angular/core'
import { Castle } from '../shared/castle'
import { Minion, Creds } from '../shared/minion'

@Component({
  selector: 'app-checkin',
  templateUrl: 'checkin.component.html',
  styleUrls: ['checkin.component.css']
})
export class CheckinComponent {
  @Input() castles: Castle[]
  @Input() minions: Minion[]
  @Input() creds: Creds
  @Output() onCredsChange: EventEmitter<any> = new EventEmitter()

  castleChanged(name: string) {
    console.log("Changed", name)
    this.creds.castle = name
    this.fireCredsChanged()
  }

  fred(evt) {
    console.log("Fred", evt)
  }

  minionChanged(name: string) {
    console.log("Changed", name)
    this.creds.minion = name
    this.fireCredsChanged()
  }

  private fireCredsChanged() {
    console.log("YO!!")
    if (this.creds.castle && this.creds.minion) {
      console.log("Firing!")
      this.onCredsChange.emit({ creds: this.creds })
    }
  }
}