import { Socket }     from "./phoenix"
import { Observable } from 'rxjs/Observable'

export class PhoenixChannel {
  socket: any
  topic: any
  channel: any
  
  constructor(socket, topic, options = {}) {
    this.socket = socket;
    this.topic = topic;
    this.channel = this.socket.channel(topic, options);
  }

  join(options = {}) {
    let joined = this.channel.join();
    return new Observable( (observer) => {
      joined
        .receive("ok", resp => {
          console.log("connected", resp);
          observer.next(resp);
        })
        .receive("error", resp => { observer.error(resp); });
    });
  }

  observeMessage(message) {
    return new Observable( (observer) => {
      this.channel.on(message, (resp) => {
        console.log(message, resp);
        observer.next(resp);
      });
    });
  }
}

export class PhoenixChannels {
  socket:any
  
  constructor(socketUrl) {
    this.socket =  new Socket(socketUrl);
    this.socket.connect();
  }

  channel(topic) {
    return new PhoenixChannel(this.socket, topic);
  }
}
