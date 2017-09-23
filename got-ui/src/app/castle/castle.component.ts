import { Component, Input } from '@angular/core'
import { Castle }           from '../shared/castle'
import { Missive }          from '../shared/missive'
import { ChannelService }   from '../channel.service'
import { MinionComponent }  from '../minion'
import { MissiveComponent } from '../missive'
import { OrderPipe }        from '../shared/order.pipe'
import { Channel }          from '../shared/phoenix'
  
@Component({
  selector:    'app-castle',
  templateUrl: 'castle.component.html',
  styleUrls:   ['castle.component.css'],
})
export class CastleComponent {
  @Input() 
  castle: Castle
  
  subscribed: boolean
  missives: Missive[]
  
  constructor(private svc: ChannelService) {
    this.missives = []
  }
  
  ngDoCheck() {
    if( this.svc.connected() && !this.subscribed ) {
      this.svc.chan.onClose( () => {
        this.subscribed = false
      })      
      this.svc.subscribe(this.castle.name, this.ravenArrived.bind(this) )
      this.subscribed = true
    }      
  }
    
  private ravenArrived(evt:string, msg:any) {
    this.missives.unshift(msg)
    
    let div = document.getElementById(this.castle.name)
    if( div ) {
      div.scrollTop = div.scrollHeight
    }
  } 
}