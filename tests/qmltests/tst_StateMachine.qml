import QtQuick 2.0
import QtTest 1.0
import QuickJSM 1.0

Item {
    id: window
    height: 640
    width: 480

    TestCase {
        name: "StateMachine"

        function test_create() {
            var fsm = new QuickJSM.StateMachine({
              init: 'solid',
              transitions: [
                { name: 'melt',     from: 'solid',  to: 'liquid' },
                { name: 'freeze',   from: 'liquid', to: 'solid'  },
                { name: 'vaporize', from: 'liquid', to: 'gas'    },
                { name: 'condense', from: 'gas',    to: 'liquid' }
              ],
              methods: {
                onMelt:     function() { console.log('I melted')    },
                onFreeze:   function() { console.log('I froze')     },
                onVaporize: function() { console.log('I vaporized') },
                onCondense: function() { console.log('I condensed') }
              }
            });

            compare(fsm.allStates(), ["none", "solid", "liquid", "gas"]);
            compare(fsm.state, "solid");
            compare(fsm.is("solid"), true);

            fsm.melt();
            compare(fsm.state, "liquid");
        }

        function test_visualize() {
            var fsm = new QuickJSM.StateMachine({
              init: 'open',
              transitions: [
                { name: 'close', from: 'open',   to: 'closed' },
                { name: 'open',  from: 'closed', to: 'open'   }
              ]
            });
            console.log(QuickJSM.visualize(fsm));
        }

        function test_StateMachineHistory() {
            var options = {
              init: 'open',
              transitions: [
                { name: 'close', from: 'open',   to: 'closed' },
                { name: 'open',  from: 'closed', to: 'open'   }
              ],
              plugins: [
                new QuickJSM.StateMachineHistory()
              ]
            }
            var fsm = new QuickJSM.StateMachine(options);

            fsm.close();
            compare(fsm.history, ["open", 'closed']);

            fsm.open();
            compare(fsm.history, ["open", 'closed', 'open']);

            fsm.historyBack();
            compare(fsm.history, ["open", 'closed']);

        }
    }
}
