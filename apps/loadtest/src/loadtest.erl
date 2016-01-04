-module(loadtest).
-behaviour(supervisor).
-behaviour(application).
-export([init/1, start/2, stop/1, main/1]).
-compile(export_all).

main(A)    -> mad_repl:sh(A).
start(_,_) -> supervisor:start_link({local,loadtest }, loadtest,[]).
stop(_)    -> ok.
init([])   -> naga:start([loadtest]), 
              sup().

% acceptors()-> wf:config(loadtest,acceptors,3).

sup()      -> { ok, { { one_for_one, 5, 100 }, [] } }.
% env()      -> [ { env, [ { dispatch, points() } ] } ].

% static()   ->   { dir, "apps/loadtest/priv/static", mime() }.
% n2o()      ->   { dir, "deps/n2o/priv",              mime() }.
% naga()     ->   { dir, "deps/naga/priv",             mime() }.

% mime()     -> [ { mimetypes, cow_mimetypes, all   } ].
% port()     -> [ { port, wf:config(n2o,port,8001)  } ].

% points() -> cowboy_router:compile([{'_', [
%                { "/static/[...]",                   n2o_static, static() }
%               ,{ "/n2o/[...]",                      n2o_static, n2o()    }
%               ,{ "/naga/[...]",                     n2o_static, naga()   }
%               ,{ "/ws/:controller/:action/[...]",   n2o_stream, []       }
%               ,{ "/ws/:controller/[...]",           n2o_stream, []       }
%               ,{ "/ws/[...]",                       n2o_stream, []       }
%               ,{ "/:controller/:action/[...]",      naga_cowboy, []      }
%               ,{ "/:controller/[...]",              naga_cowboy, []      }
%               ,{ "/[...]",                          naga_cowboy, []      }
%             ]}]).

%log_modules() -> [n2o_client,n2o_nitrogen,n2o_stream,wf_convert,index,error,loadtest,loadtest_routes].
log_modules() -> [].
