window.APP = {
  template: '#app_template',
  name: 'app',
  data () {
    return {
      style: CONFIG.style,
      showInput: false,
      showWindow: false,
      suggestions: [],
      templates: CONFIG.templates,
      message: '',
      maxAreaChar: 200,
      messages: [],
      oldMessages: [],
      oldMessagesIndex: -1,
      showChat: true,
      time2: 0,
      loocTime: 0,
      isError: false,
      isError2: false
    };
  },
  destroyed () {
    clearInterval(this.focusTimer);
    window.removeEventListener('message', this.listener);
  },
  mounted () {
    this.$nextTick(function () {
      window.setInterval(() => {
        this.loocTime = this.time2 - Math.round(new Date().getTime() / 1000)
      }, 1000);
    })
    post('http://chat/loaded', JSON.stringify({}));
    this.listener = window.addEventListener('message', (event) => {
      const item = event.data || event.detail; //'detail' is for debuging via browsers
      if (this[item.type]) {
        this[item.type](item);
      }
    });
  },
  watch: {
    messages () {
      if (this.showWindowTimer) {
        clearTimeout(this.showWindowTimer);
      }
      this.showWindow = true;
      this.resetShowWindowTimer();

      const messagesObj = this.$refs.messages;
      this.$nextTick(() => {
        messagesObj.scrollTop = messagesObj.scrollHeight;
      });
    },
  },
  methods: {
    editedTextArea () {
      if (!this.message.startsWith('/')) {
        this.maxAreaChar = 81
        if (this.message.length > 80) {
          this.message = this.message.substring(0, 80)
          this.isError = true
          setTimeout(() => {
            this.isError = false
          }, 600)
        }
      } else {
        this.maxAreaChar = 200
      }
    },
    ON_OPEN () {
      this.showInput = true;
      this.showWindow = true;
      if (this.showWindowTimer) {
        clearTimeout(this.showWindowTimer);
      }
      this.focusTimer = setInterval(() => {
        if (this.$refs.input) {
          this.$refs.input.focus();
        } else {
          clearInterval(this.focusTimer);
        }
      }, 100);
    },
    ON_TIME ({ time }) {
      //loocTime - Math.round(new Date().getTime()/1000)
      this.time2 = time
    },
    ON_MESSAGE ({ message }) {
      this.messages.push(message);
    },
    ON_HIDE () {
      $('.chat-window').hide("fold")
      //this.showChat = false
    },
    ON_SHOW () {
      //this.showChat = true
      $('.chat-window').show("fold")
      /*
      const messagesObj = this.$refs.messages;
      this.$nextTick(() => {
        messagesObj.scrollTop = messagesObj.scrollHeight;
      });*/
    },
    ON_CLEAR () {
      this.messages = [];
      this.oldMessages = [];
      this.oldMessagesIndex = -1;
    },
    ON_SUGGESTION_ADD ({ suggestion }) {
      if (!suggestion.params) {
        suggestion.params = []; //TODO Move somewhere else
      }
      if (this.suggestions.find(a => a.name == suggestion.name)) {
        return;
      }
      this.suggestions.push(suggestion);
    },
    ON_SUGGESTION_REMOVE ({ name }) {
      this.suggestions = this.suggestions.filter((sug) => sug.name !== name)
    },
    ON_TEMPLATE_ADD ({ template }) {
      if (this.templates[template.id]) {
        this.warn(`Tried to add duplicate template '${template.id}'`)
      } else {
        this.templates[template.id] = template.html;
      }
    },
    warn (msg) {
      this.messages.push({
        args: [msg],
        template: '^3<b>CHAT-WARN</b>: ^0{0}',
      });
    },
    clearShowWindowTimer () {
      clearTimeout(this.showWindowTimer);
    },
    resetShowWindowTimer () {
      this.clearShowWindowTimer();
      this.showWindowTimer = setTimeout(() => {
        if (!this.showInput) {
          this.showWindow = false;
        }
      }, CONFIG.fadeTimeout);
    },
    keyUp () {
      this.resize();
    },
    keyDown (e) {
      if (e.which === 38 || e.which === 40) {
        e.preventDefault();
        this.moveOldMessageIndex(e.which === 38);
      } else if (e.which == 33) {
        var buf = document.getElementsByClassName('chat-messages')[0];
        buf.scrollTop = buf.scrollTop - 100;
      } else if (e.which == 34) {
        var buf = document.getElementsByClassName('chat-messages')[0];
        buf.scrollTop = buf.scrollTop + 100;
      }
    },
    moveOldMessageIndex (up) {
      if (up && this.oldMessages.length > this.oldMessagesIndex + 1) {
        this.oldMessagesIndex += 1;
        this.message = this.oldMessages[this.oldMessagesIndex];
      } else if (!up && this.oldMessagesIndex - 1 >= 0) {
        this.oldMessagesIndex -= 1;
        this.message = this.oldMessages[this.oldMessagesIndex];
      } else if (!up && this.oldMessagesIndex - 1 === -1) {
        this.oldMessagesIndex = -1;
        this.message = '';
      }
    },
    resize () {
      const input = this.$refs.input;
      input.style.height = '5px';
      input.style.height = `${input.scrollHeight + 2}px`;
    },

    /*
      local args = { text }
  if author ~= "" then
    table.insert(args, 1, author)
  end

  if(not chatVisibilityToggle)then
    SendNUIMessage({
      type = 'ON_MESSAGE',
      message = {
        color = color,
        multiline = true,
        args = args
      }
    })
  end*/
    send (e) {
      if (this.loocTime > 0 && !this.message.startsWith('/')) {
        if (!this.isError2) {
          this.ON_MESSAGE({
            message: {
              color: null,
              args: [`Chat ^7> ^1Musíš počkat ${this.loocTime} sekund než budeš moct poslat další zprávu do looc!`],
              multiline: true,
            }
          })
          this.isError2 = true
          setTimeout(() => {
            this.isError2 = false
          }, 1000)
        }
        return
      }
      if (this.message !== '') {
        post('http://chat/chatResult', JSON.stringify({
          message: this.message,
        }));
        this.oldMessages.unshift(this.message);
        this.oldMessagesIndex = -1;
        this.hideInput();
      } else {
        this.hideInput(true);
      }
    },
    hideInput (canceled = false) {
      if (canceled) {
        post('http://chat/chatResult', JSON.stringify({ canceled }));
      }
      this.message = '';
      this.showInput = false;
      clearInterval(this.focusTimer);
      this.resetShowWindowTimer();
    },
  },
};
