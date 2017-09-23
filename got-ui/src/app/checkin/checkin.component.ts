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
    this.creds.castle = name
    this.fireCredsChanged()
  }

  minionChanged(name: string) {
    this.creds.minion = name
    this.fireCredsChanged()
  }

  private fireCredsChanged() {
    if (this.creds.castle && this.creds.minion) {
      this.onCredsChange.emit({ creds: this.creds })
    }
  }
}